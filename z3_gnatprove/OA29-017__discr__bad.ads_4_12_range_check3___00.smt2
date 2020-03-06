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

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ()
((positive__ref (positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun to_rep ((x positive)) Int (positiveqtint x))

(declare-fun of_rep (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range1 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-fun too_small (tuple0) Int)

(declare-fun too_small__function_guard (Int tuple0) Bool)

;; too_small__post_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (let ((result (too_small us_void_param)))
     (=> (too_small__function_guard result us_void_param) (dynamic_invariant
     result true false true true))) :pattern ((too_small us_void_param)) )))

;; too_small__def_axiom
  (assert
  (forall ((us_void_param tuple0))
  (! (= (too_small us_void_param) 0) :pattern ((too_small us_void_param)) )))

(declare-const r1s Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun to_rep1 ((x integer)) Int (integerqtint x))

(declare-fun of_rep1 (Int) integer)

;; inversion_axiom
  (assert
  (forall ((x integer))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x integer)) (! (in_range (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                             (of_rep1 x))) )))

(declare-datatypes ()
((us_split_discrs (us_split_discrsqtmk (rec__discr__t__c positive)))))
(define-fun us_split_discrs_rec__discr__t__c__projection ((a us_split_discrs)) positive 
  (rec__discr__t__c a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields (us_split_fieldsqtmk (rec__discr__t__a integer)))))
(define-fun us_split_fields_rec__discr__t__a__projection ((a us_split_fields)) integer 
  (rec__discr__t__a a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep (rec__discr__t__c (us_split_discrs1 a))) 
                        (to_rep (rec__discr__t__c (us_split_discrs1 b))))
                        (= (to_rep1 (rec__discr__t__a (us_split_fields1 a))) 
                        (to_rep1 (rec__discr__t__a (us_split_fields1 b)))))
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

(declare-const discr__t__c__first__bit Int)

(declare-const discr__t__c__last__bit Int)

(declare-const discr__t__c__position Int)

;; discr__t__c__first__bit_axiom
  (assert (<= 0 discr__t__c__first__bit))

;; discr__t__c__last__bit_axiom
  (assert (< discr__t__c__first__bit discr__t__c__last__bit))

;; discr__t__c__position_axiom
  (assert (<= 0 discr__t__c__position))

(declare-const discr__t__a__first__bit Int)

(declare-const discr__t__a__last__bit Int)

(declare-const discr__t__a__position Int)

;; discr__t__a__first__bit_axiom
  (assert (<= 0 discr__t__a__first__bit))

;; discr__t__a__last__bit_axiom
  (assert (< discr__t__a__first__bit discr__t__a__last__bit))

;; discr__t__a__position_axiom
  (assert (<= 0 discr__t__a__position))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes () ((tp1S__ref (tp1S__refqtmk (tp1S__content us_rep)))))
(define-fun tp1S__ref_tp1S__content__projection ((a tp1S__ref)) us_rep 
  (tp1S__content a))

(define-fun in_range2 ((rec__discr__t__c1 Int)
  (a us_split_discrs)) Bool (= rec__discr__t__c1 (to_rep
                                                 (rec__discr__t__c a))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const discr__t__c__first__bit1 Int)

(declare-const discr__t__c__last__bit1 Int)

(declare-const discr__t__c__position1 Int)

;; discr__t__c__first__bit_axiom
  (assert (<= 0 discr__t__c__first__bit1))

;; discr__t__c__last__bit_axiom
  (assert (< discr__t__c__first__bit1 discr__t__c__last__bit1))

;; discr__t__c__position_axiom
  (assert (<= 0 discr__t__c__position1))

(declare-const discr__t__a__first__bit1 Int)

(declare-const discr__t__a__last__bit1 Int)

(declare-const discr__t__a__position1 Int)

;; discr__t__a__first__bit_axiom
  (assert (<= 0 discr__t__a__first__bit1))

;; discr__t__a__last__bit_axiom
  (assert (< discr__t__a__first__bit1 discr__t__a__last__bit1))

;; discr__t__a__position_axiom
  (assert (<= 0 discr__t__a__position1))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes () ((t__ref (t__refqtmk (t__content us_rep)))))
(define-fun t__ref_t__content__projection ((a t__ref)) us_rep (t__content a))

(declare-const p1__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_166 us_rep)
  (temp___is_init_162 Bool) (temp___skip_constant_163 Bool)
  (temp___do_toplevel_164 Bool)
  (temp___do_typ_inv_165 Bool)) Bool (=>
                                     (not (= temp___skip_constant_163 true))
                                     (in_range2 r1s
                                     (us_split_discrs1 temp___expr_166))))

(define-fun default_initial_assumption ((temp___expr_168 us_rep)
  (temp___skip_top_level_169 Bool)) Bool (= (to_rep
                                            (rec__discr__t__c
                                            (us_split_discrs1
                                            temp___expr_168))) r1s))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range1
                                    temp___expr_46)))

;; r1s__def_axiom
  (assert
  (and (too_small__function_guard (too_small Tuple0) Tuple0)
  (= r1s (too_small Tuple0))))

(define-fun bad__R1s__assume () Int (too_small Tuple0))

;; H
  (assert (too_small__function_guard bad__R1s__assume Tuple0))

;; H
  (assert (dynamic_invariant bad__R1s__assume true false true true))

;; H
  (assert (= bad__R1s__assume 0))

;; Assume
  (assert (= bad__R1s__assume r1s))

;; Assume
  (assert (dynamic_invariant r1s true false true true))

(assert
;; defqtvc
 ;; File "bad.ads", line 2, characters 0-0
  (not (in_range1 r1s)))
(check-sat)