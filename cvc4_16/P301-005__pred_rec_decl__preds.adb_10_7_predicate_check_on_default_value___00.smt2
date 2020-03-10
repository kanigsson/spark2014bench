(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: CVC4
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes ((tuple0 0))
(((Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ((us_type_of_heap__ref 0))
(((us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes ((int__ref 0))
(((int__refqtmk (int__content Int)))))
(declare-datatypes ((bool__ref 0))
(((bool__refqtmk (bool__content Bool)))))
(declare-datatypes ((us_fixed__ref 0))
(((us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes ((real__ref 0))
(((real__refqtmk (real__content Real)))))
(declare-datatypes ((us_private__ref 0))
(((us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const i9s Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort int_bad 0)

(declare-fun int_badqtint (int_bad) Int)

;; int_bad'axiom
  (assert
  (forall ((i int_bad))
  (and (<= (- 2147483648) (int_badqtint i)) (<= (int_badqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (int_bad int_bad) Bool)

(declare-const dummy int_bad)

(declare-datatypes ((int_bad__ref 0))
(((int_bad__refqtmk (int_bad__content int_bad)))))
(define-fun int_bad__ref_int_bad__content__projection ((a int_bad__ref)) int_bad 
  (int_bad__content a))

(define-fun dynamic_invariant ((temp___expr_182 Int)
  (temp___is_init_178 Bool) (temp___skip_constant_179 Bool)
  (temp___do_toplevel_180 Bool)
  (temp___do_typ_inv_181 Bool)) Bool (and
                                     (=>
                                     (or (= temp___is_init_178 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range temp___expr_182))
                                     (=> (= temp___do_toplevel_180 true)
                                     (or
                                     (and (<= (- 2147483648) temp___expr_182)
                                     (<= temp___expr_182 (- 1)))
                                     (and (<= 1 temp___expr_182)
                                     (<= temp___expr_182 2147483647))))))

(define-fun dynamic_predicate ((temp___186 Int)) Bool (or
                                                      (and
                                                      (<= (- 2147483648) temp___186)
                                                      (<= temp___186 (- 1)))
                                                      (and (<= 1 temp___186)
                                                      (<= temp___186 2147483647))))

(define-fun to_rep ((x int_bad)) Int (int_badqtint x))

(declare-fun of_rep (Int) int_bad)

;; inversion_axiom
  (assert
  (forall ((x int_bad)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x int_bad)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(assert
;; defqtvc
 ;; File "preds.ads", line 12, characters 0-0
  (not
  (forall ((x Int) (usf int_bad))
  (=> (dynamic_invariant i9s true false true true)
  (=> (dynamic_invariant i9s true false true true)
  (=> (dynamic_invariant x false false true true)
  (=> (= (to_rep usf) 0)
  (let ((temp___385 (to_rep usf)))
  (or (and (<= (- 2147483648) temp___385) (<= temp___385 (- 1)))
  (and (<= 1 temp___385) (<= temp___385 2147483647)))))))))))
(check-sat)
(exit)
