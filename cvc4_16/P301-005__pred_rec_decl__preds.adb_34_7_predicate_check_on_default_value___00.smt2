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

(declare-const i17s Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort sub_intp_bad 0)

(declare-fun sub_intp_badqtint (sub_intp_bad) Int)

;; sub_intp_bad'axiom
  (assert
  (forall ((i sub_intp_bad))
  (and (<= (- 2147483648) (sub_intp_badqtint i))
  (<= (sub_intp_badqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (sub_intp_bad sub_intp_bad) Bool)

(declare-const dummy sub_intp_bad)

(declare-datatypes ((sub_intp_bad__ref 0))
(((sub_intp_bad__refqtmk (sub_intp_bad__content sub_intp_bad)))))
(define-fun sub_intp_bad__ref_sub_intp_bad__content__projection ((a sub_intp_bad__ref)) sub_intp_bad 
  (sub_intp_bad__content a))

(define-fun dynamic_invariant ((temp___expr_246 Int)
  (temp___is_init_242 Bool) (temp___skip_constant_243 Bool)
  (temp___do_toplevel_244 Bool)
  (temp___do_typ_inv_245 Bool)) Bool (and
                                     (=>
                                     (or (= temp___is_init_242 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range temp___expr_246))
                                     (=> (= temp___do_toplevel_244 true)
                                     (or
                                     (and (<= (- 2147483648) temp___expr_246)
                                     (<= temp___expr_246 (- 1)))
                                     (and (<= 1 temp___expr_246)
                                     (<= temp___expr_246 2147483647))))))

(define-fun dynamic_predicate ((temp___250 Int)) Bool (or
                                                      (and
                                                      (<= (- 2147483648) temp___250)
                                                      (<= temp___250 (- 1)))
                                                      (and (<= 1 temp___250)
                                                      (<= temp___250 2147483647))))

(define-fun to_rep ((x sub_intp_bad)) Int (sub_intp_badqtint x))

(declare-fun of_rep (Int) sub_intp_bad)

;; inversion_axiom
  (assert
  (forall ((x sub_intp_bad))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x sub_intp_bad)) (! (in_range
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(assert
;; defqtvc
 ;; File "preds.ads", line 39, characters 0-0
  (not
  (forall ((x Int) (usf sub_intp_bad))
  (=> (dynamic_invariant i17s true false true true)
  (=> (dynamic_invariant i17s true false true true)
  (=> (dynamic_invariant x false false true true)
  (=> (= (to_rep usf) 0)
  (let ((temp___405 (to_rep usf)))
  (or (and (<= (- 2147483648) temp___405) (<= temp___405 (- 1)))
  (and (<= 1 temp___405) (<= temp___405 2147483647)))))))))))
(check-sat)
(exit)
