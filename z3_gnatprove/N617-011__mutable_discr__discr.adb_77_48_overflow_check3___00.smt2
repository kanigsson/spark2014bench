(set-info :smt-lib-version 2.6)
(set-logic AUFBVFPDTNIRA)
(set-info :source |
Generated by: AdaCore
Generated on: 2020-03-06
Generator: SPARK
Application: Program verification for Ada
Target solver: Z3
|)
(set-info :license "https://creativecommons.org/licenses/by/4.0/")
(set-info :category "industrial")
(set-info :status unknown)
;;; generated by SMT-LIB2 driver
;;; SMT-LIB2 driver: bit-vectors, common part
;;; SMT-LIB2: integer arithmetic
(declare-sort string 0)

(declare-datatypes () ((tuple0 (Tuple0))))
(declare-sort us_private 0)

(declare-fun private__bool_eq (us_private us_private) Bool)

(declare-const us_null_ext__ us_private)

(declare-sort us_type_of_heap 0)

(declare-datatypes ()
((us_type_of_heap__ref
 (us_type_of_heap__refqtmk (us_type_of_heap__content us_type_of_heap)))))
(declare-sort us_image 0)

(declare-datatypes () ((int__ref (int__refqtmk (int__content Int)))))
(declare-datatypes () ((bool__ref (bool__refqtmk (bool__content Bool)))))
(declare-datatypes ()
((us_fixed__ref (us_fixed__refqtmk (us_fixed__content Int)))))
(declare-datatypes () ((real__ref (real__refqtmk (real__content Real)))))
(declare-datatypes ()
((us_private__ref (us_private__refqtmk (us_private__content us_private)))))
(define-fun int__ref___projection ((a int__ref)) Int (int__content a))

(define-fun us_fixed__ref___projection ((a us_fixed__ref)) Int (us_fixed__content
                                                               a))

(define-fun bool__ref___projection ((a bool__ref)) Bool (bool__content a))

(define-fun real__ref___projection ((a real__ref)) Real (real__content a))

(define-fun us_private__ref___projection ((a us_private__ref)) us_private 
  (us_private__content a))

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= (- 2147483648) x)
                                    (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ()
((integer__ref (integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ()
((natural__ref (natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-const c Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__discr__r6__with_bad_default1__d natural)))))
(define-fun us_split_discrs_rec__discr__r6__with_bad_default1__d__projection ((a us_split_discrs)) natural 
  (rec__discr__r6__with_bad_default1__d a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__3__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_discrs1 us_split_discrs)))))
(define-fun us_rep___split_discrs__3__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__discr__r6__with_bad_default1__d
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__discr__r6__with_bad_default1__d
                                                  (us_split_discrs1 b))))
                   true false))

(define-fun in_range2 ((rec__discr__r6__with_bad_default1__d1 Int)
  (a us_split_discrs)) Bool (= rec__discr__r6__with_bad_default1__d1 
  (to_rep (rec__discr__r6__with_bad_default1__d a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const discr__r6__with_bad_default1__d__first__bit Int)

(declare-const discr__r6__with_bad_default1__d__last__bit Int)

(declare-const discr__r6__with_bad_default1__d__position Int)

;; discr__r6__with_bad_default1__d__first__bit_axiom
  (assert (<= 0 discr__r6__with_bad_default1__d__first__bit))

;; discr__r6__with_bad_default1__d__last__bit_axiom
  (assert
  (< discr__r6__with_bad_default1__d__first__bit discr__r6__with_bad_default1__d__last__bit))

;; discr__r6__with_bad_default1__d__position_axiom
  (assert (<= 0 discr__r6__with_bad_default1__d__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ()
((with_bad_default1__ref
 (with_bad_default1__refqtmk (with_bad_default1__content us_rep)))))
(define-fun with_bad_default1__ref_with_bad_default1__content__projection ((a with_bad_default1__ref)) us_rep 
  (with_bad_default1__content a))

(declare-const d1__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun default_initial_assumption ((temp___expr_224 us_rep)
  (temp___skip_top_level_225 Bool)) Bool (= (to_rep
                                            (rec__discr__r6__with_bad_default1__d
                                            (us_split_discrs1
                                            temp___expr_224))) (+ c 1)))

(declare-fun f (Int) Int)

(declare-fun f__function_guard (Int Int) Bool)

;; f__post_axiom
  (assert
  (forall ((x Int))
  (! (=> (and (dynamic_invariant x true true true true) (< 0 x))
     (let ((result (f x)))
     (=> (f__function_guard result x) (dynamic_invariant result true false
     true true)))) :pattern ((f x)) )))

;; f__def_axiom
  (assert
  (forall ((x Int))
  (! (=> (dynamic_invariant x true true true true) (= (f x) (- x 1))) :pattern (
  (f x)) )))

(declare-datatypes ()
((us_split_discrs2
 (us_split_discrsqtmk1 (rec__discr__r6__with_bad_default2__d natural)))))
(define-fun us_split_discrs_rec__discr__r6__with_bad_default2__d__projection ((a us_split_discrs2)) natural 
  (rec__discr__r6__with_bad_default2__d a))

(declare-datatypes ()
((us_split_discrs__ref1
 (us_split_discrs__refqtmk1 (us_split_discrs__content1 us_split_discrs2)))))
(define-fun us_split_discrs__ref___split_discrs__content__4__projection ((a us_split_discrs__ref1)) us_split_discrs2 
  (us_split_discrs__content1 a))

(declare-datatypes ()
((us_rep1 (us_repqtmk1 (us_split_discrs3 us_split_discrs2)))))
(define-fun us_rep___split_discrs__4__projection ((a us_rep1)) us_split_discrs2 
  (us_split_discrs3 a))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (= (to_rep
                            (rec__discr__r6__with_bad_default2__d
                            (us_split_discrs3 a))) (to_rep
                                                   (rec__discr__r6__with_bad_default2__d
                                                   (us_split_discrs3 b))))
                    true false))

(define-fun in_range3 ((rec__discr__r6__with_bad_default2__d1 Int)
  (a us_split_discrs2)) Bool (= rec__discr__r6__with_bad_default2__d1 
  (to_rep (rec__discr__r6__with_bad_default2__d a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const discr__r6__with_bad_default2__d__first__bit Int)

(declare-const discr__r6__with_bad_default2__d__last__bit Int)

(declare-const discr__r6__with_bad_default2__d__position Int)

;; discr__r6__with_bad_default2__d__first__bit_axiom
  (assert (<= 0 discr__r6__with_bad_default2__d__first__bit))

;; discr__r6__with_bad_default2__d__last__bit_axiom
  (assert
  (< discr__r6__with_bad_default2__d__first__bit discr__r6__with_bad_default2__d__last__bit))

;; discr__r6__with_bad_default2__d__position_axiom
  (assert (<= 0 discr__r6__with_bad_default2__d__position))

(declare-fun user_eq3 (us_rep1 us_rep1) Bool)

(declare-const dummy3 us_rep1)

(declare-datatypes ()
((with_bad_default2__ref
 (with_bad_default2__refqtmk (with_bad_default2__content us_rep1)))))
(define-fun with_bad_default2__ref_with_bad_default2__content__projection ((a with_bad_default2__ref)) us_rep1 
  (with_bad_default2__content a))

(declare-const d2__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

;; temp___result_236'def
  (assert (f__function_guard (f c) c))

(define-fun default_initial_assumption1 ((temp___expr_233 us_rep1)
  (temp___skip_top_level_234 Bool)) Bool (= (to_rep
                                            (rec__discr__r6__with_bad_default2__d
                                            (us_split_discrs3
                                            temp___expr_233))) (f c)))

(define-fun dynamic_invariant1 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(declare-const d1__split_discrs natural)

;; Assume
  (assert (dynamic_invariant c true false true true))

(define-fun o () Int (+ c 1))

(assert
;; defqtvc
 ;; File "discr.ads", line 18, characters 0-0
  (not (in_range o)))
(check-sat)
