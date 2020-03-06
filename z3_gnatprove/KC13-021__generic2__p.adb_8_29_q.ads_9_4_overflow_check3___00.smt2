;; produced by z3_gnatprove.drv ;;
(set-info :smt-lib-version 2.5)
(set-info :source |VC generated by SPARK 2014|)
(set-info :category industrial)
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

(define-fun dynamic_invariant ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647)) (in_range
                                    temp___expr_18)))

(define-fun to_rep ((x integer)) Int (integerqtint x))

(declare-fun of_rep (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-fun qf1 (Int) Int)

(declare-fun qf1__function_guard (Int Int) Bool)

;; qf1__post_axiom
  (assert
  (forall ((j Int))
  (! (=> (dynamic_invariant j true true true true)
     (let ((result (qf1 j)))
     (=> (qf1__function_guard result j) (dynamic_invariant result true false
     true true)))) :pattern ((qf1 j)) )))

(declare-const a Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const b Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const c Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(define-fun in_range1 ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Bool)

(declare-sort t1 0)

(declare-fun t1qtint (t1) Int)

;; t1'axiom
  (assert
  (forall ((i t1))
  (and (<= (- 2147483648) (t1qtint i)) (<= (t1qtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (t1 t1) Bool)

(declare-const dummy1 t1)

(declare-datatypes () ((t1__ref (t1__refqtmk (t1__content t1)))))
(define-fun t1__ref_t1__content__projection ((a1 t1__ref)) t1 (t1__content
                                                              a1))

(define-fun to_rep1 ((x t1)) Int (t1qtint x))

(declare-fun of_rep1 (Int) t1)

;; inversion_axiom
  (assert
  (forall ((x t1)) (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x t1)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort t3 0)

(declare-fun t3qtint (t3) Int)

;; t3'axiom
  (assert
  (forall ((i t3)) (and (<= 0 (t3qtint i)) (<= (t3qtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (t3 t3) Bool)

(declare-const dummy2 t3)

(declare-datatypes () ((t3__ref (t3__refqtmk (t3__content t3)))))
(define-fun t3__ref_t3__content__projection ((a1 t3__ref)) t3 (t3__content
                                                              a1))

(define-fun to_rep2 ((x t3)) Int (t3qtint x))

(declare-fun of_rep2 (Int) t3)

;; inversion_axiom
  (assert
  (forall ((x t3)) (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x t3)) (! (in_range3 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__q__p1__r__a t1)(rec__q__p1__r__b Bool)(rec__q__p1__r__c t3)(rec__q__p1__r__d integer)))))
(define-fun us_split_fields_rec__q__p1__r__a__projection ((a1 us_split_fields)) t1 
  (rec__q__p1__r__a a1))

(define-fun us_split_fields_rec__q__p1__r__b__projection ((a1 us_split_fields)) Bool 
  (rec__q__p1__r__b a1))

(define-fun us_split_fields_rec__q__p1__r__c__projection ((a1 us_split_fields)) t3 
  (rec__q__p1__r__c a1))

(define-fun us_split_fields_rec__q__p1__r__d__projection ((a1 us_split_fields)) integer 
  (rec__q__p1__r__d a1))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a1 us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a1))

(declare-datatypes ()
((us_rep (us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__projection ((a1 us_rep)) us_split_fields 
  (us_split_fields1 a1))

(define-fun bool_eq ((a1 us_rep)
  (b1 us_rep)) Bool (ite (and
                         (and
                         (= (to_rep1
                            (rec__q__p1__r__a (us_split_fields1 a1))) 
                         (to_rep1 (rec__q__p1__r__a (us_split_fields1 b1))))
                         (= (ite (rec__q__p1__r__b (us_split_fields1 a1)) 1 0) (ite 
                         (rec__q__p1__r__b (us_split_fields1 b1)) 1 0)))
                         (and
                         (= (to_rep2
                            (rec__q__p1__r__c (us_split_fields1 a1))) 
                         (to_rep2 (rec__q__p1__r__c (us_split_fields1 b1))))
                         (= (to_rep (rec__q__p1__r__d (us_split_fields1 a1))) 
                         (to_rep (rec__q__p1__r__d (us_split_fields1 b1))))))
                    true false))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const q__p1__r__a__first__bit Int)

(declare-const q__p1__r__a__last__bit Int)

(declare-const q__p1__r__a__position Int)

;; q__p1__r__a__first__bit_axiom
  (assert (<= 0 q__p1__r__a__first__bit))

;; q__p1__r__a__last__bit_axiom
  (assert (< q__p1__r__a__first__bit q__p1__r__a__last__bit))

;; q__p1__r__a__position_axiom
  (assert (<= 0 q__p1__r__a__position))

(declare-const q__p1__r__b__first__bit Int)

(declare-const q__p1__r__b__last__bit Int)

(declare-const q__p1__r__b__position Int)

;; q__p1__r__b__first__bit_axiom
  (assert (<= 0 q__p1__r__b__first__bit))

;; q__p1__r__b__last__bit_axiom
  (assert (< q__p1__r__b__first__bit q__p1__r__b__last__bit))

;; q__p1__r__b__position_axiom
  (assert (<= 0 q__p1__r__b__position))

(declare-const q__p1__r__c__first__bit Int)

(declare-const q__p1__r__c__last__bit Int)

(declare-const q__p1__r__c__position Int)

;; q__p1__r__c__first__bit_axiom
  (assert (<= 0 q__p1__r__c__first__bit))

;; q__p1__r__c__last__bit_axiom
  (assert (< q__p1__r__c__first__bit q__p1__r__c__last__bit))

;; q__p1__r__c__position_axiom
  (assert (<= 0 q__p1__r__c__position))

(declare-const q__p1__r__d__first__bit Int)

(declare-const q__p1__r__d__last__bit Int)

(declare-const q__p1__r__d__position Int)

;; q__p1__r__d__first__bit_axiom
  (assert (<= 0 q__p1__r__d__first__bit))

;; q__p1__r__d__last__bit_axiom
  (assert (< q__p1__r__d__first__bit q__p1__r__d__last__bit))

;; q__p1__r__d__position_axiom
  (assert (<= 0 q__p1__r__d__position))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes () ((r__ref (r__refqtmk (r__content us_rep)))))
(define-fun r__ref_r__content__projection ((a1 r__ref)) us_rep (r__content
                                                               a1))

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(define-fun dynamic_invariant1 ((temp___expr_161 Int)
  (temp___is_init_157 Bool) (temp___skip_constant_158 Bool)
  (temp___do_toplevel_159 Bool)
  (temp___do_typ_inv_160 Bool)) Bool (=>
                                     (or (= temp___is_init_157 true)
                                     (<= (- 2147483648) 2147483647))
                                     (in_range2 temp___expr_161)))

(define-fun dynamic_invariant2 ((temp___expr_168 Int)
  (temp___is_init_164 Bool) (temp___skip_constant_165 Bool)
  (temp___do_toplevel_166 Bool)
  (temp___do_typ_inv_167 Bool)) Bool (=>
                                     (or (= temp___is_init_164 true)
                                     (<= 0 2147483647)) (in_range3
                                     temp___expr_168)))

(declare-const result____split_fields us_split_fields)

(declare-const tmp Int)

;; Assume
  (assert (dynamic_invariant1 a true false true true))

;; Assume
  (assert (dynamic_invariant2 c true false true true))

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert true)

;; Assume
  (assert (dynamic_invariant tmp false false true true))

(declare-const tmp1 Int)

;; H
  (assert (= tmp1 1))

(define-fun o () Int (qf1 2))

;; H
  (assert (qf1__function_guard o 2))

;; H
  (assert (dynamic_invariant o true false true true))

(define-fun o1 () Int (+ tmp1 o))

;; Ensures
  (assert (in_range o1))

(define-fun o2 () Int (+ o1 7))

(assert
;; defqtvc
 ;; File "p.ads", line 23, characters 0-0
  (not (in_range o2)))
(check-sat)