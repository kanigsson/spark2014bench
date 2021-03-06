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

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Int)

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(define-fun to_rep ((x natural)) Int (naturalqtint x))

(declare-fun of_rep (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural)) (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                           (of_rep x))) )))

(declare-const c Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__discr__with_default__c natural)))))
(define-fun us_split_discrs_rec__discr__with_default__c__projection ((a us_split_discrs)) natural 
  (rec__discr__with_default__c a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_discrs1 us_split_discrs)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (= (to_rep
                           (rec__discr__with_default__c (us_split_discrs1 a))) 
                   (to_rep
                   (rec__discr__with_default__c (us_split_discrs1 b)))) true
                   false))

(define-fun in_range1 ((rec__discr__with_default__c1 Int)
  (a us_split_discrs)) Bool (= rec__discr__with_default__c1 (to_rep
                                                            (rec__discr__with_default__c
                                                            a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const discr__with_default__c__first__bit Int)

(declare-const discr__with_default__c__last__bit Int)

(declare-const discr__with_default__c__position Int)

;; discr__with_default__c__first__bit_axiom
  (assert (<= 0 discr__with_default__c__first__bit))

;; discr__with_default__c__last__bit_axiom
  (assert
  (< discr__with_default__c__first__bit discr__with_default__c__last__bit))

;; discr__with_default__c__position_axiom
  (assert (<= 0 discr__with_default__c__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((with_default__ref 0))
(((with_default__refqtmk (with_default__content us_rep)))))
(define-fun with_default__ref_with_default__content__projection ((a with_default__ref)) us_rep 
  (with_default__content a))

(declare-const d__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun default_initial_assumption ((temp___expr_169 us_rep)
  (temp___skip_top_level_170 Bool)) Bool (= (to_rep
                                            (rec__discr__with_default__c
                                            (us_split_discrs1
                                            temp___expr_169))) 0))

(declare-const d1__split_discrs us_split_discrs)

(declare-const d1__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const d2__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const discr__with_default__c__first__bit1 Int)

(declare-const discr__with_default__c__last__bit1 Int)

(declare-const discr__with_default__c__position1 Int)

;; discr__with_default__c__first__bit_axiom
  (assert (<= 0 discr__with_default__c__first__bit1))

;; discr__with_default__c__last__bit_axiom
  (assert
  (< discr__with_default__c__first__bit1 discr__with_default__c__last__bit1))

;; discr__with_default__c__position_axiom
  (assert (<= 0 discr__with_default__c__position1))

(declare-fun user_eq2 (us_rep us_rep) Bool)

(declare-const dummy2 us_rep)

(declare-datatypes ((t4b__ref 0))
(((t4b__refqtmk (t4b__content us_rep)))))
(define-fun t4b__ref_t4b__content__projection ((a t4b__ref)) us_rep (t4b__content
                                                                    a))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const discr__with_default__c__first__bit2 Int)

(declare-const discr__with_default__c__last__bit2 Int)

(declare-const discr__with_default__c__position2 Int)

;; discr__with_default__c__first__bit_axiom
  (assert (<= 0 discr__with_default__c__first__bit2))

;; discr__with_default__c__last__bit_axiom
  (assert
  (< discr__with_default__c__first__bit2 discr__with_default__c__last__bit2))

;; discr__with_default__c__position_axiom
  (assert (<= 0 discr__with_default__c__position2))

(declare-fun user_eq3 (us_rep us_rep) Bool)

(declare-const dummy3 us_rep)

(declare-datatypes ((td1S__ref 0))
(((td1S__refqtmk (td1S__content us_rep)))))
(define-fun td1S__ref_td1S__content__projection ((a td1S__ref)) us_rep 
  (td1S__content a))

(define-fun dynamic_invariant1 ((temp___expr_186 us_rep)
  (temp___is_init_182 Bool) (temp___skip_constant_183 Bool)
  (temp___do_toplevel_184 Bool)
  (temp___do_typ_inv_185 Bool)) Bool (=>
                                     (not (= temp___skip_constant_183 true))
                                     (in_range1 c
                                     (us_split_discrs1 temp___expr_186))))

(define-fun default_initial_assumption1 ((temp___expr_188 us_rep)
  (temp___skip_top_level_189 Bool)) Bool (= (to_rep
                                            (rec__discr__with_default__c
                                            (us_split_discrs1
                                            temp___expr_188))) c))

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const discr__with_default__c__first__bit3 Int)

(declare-const discr__with_default__c__last__bit3 Int)

(declare-const discr__with_default__c__position3 Int)

;; discr__with_default__c__first__bit_axiom
  (assert (<= 0 discr__with_default__c__first__bit3))

;; discr__with_default__c__last__bit_axiom
  (assert
  (< discr__with_default__c__first__bit3 discr__with_default__c__last__bit3))

;; discr__with_default__c__position_axiom
  (assert (<= 0 discr__with_default__c__position3))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((t5b__ref 0))
(((t5b__refqtmk (t5b__content us_rep)))))
(define-fun t5b__ref_t5b__content__projection ((a t5b__ref)) us_rep (t5b__content
                                                                    a))

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const discr__with_default__c__first__bit4 Int)

(declare-const discr__with_default__c__last__bit4 Int)

(declare-const discr__with_default__c__position4 Int)

;; discr__with_default__c__first__bit_axiom
  (assert (<= 0 discr__with_default__c__first__bit4))

;; discr__with_default__c__last__bit_axiom
  (assert
  (< discr__with_default__c__first__bit4 discr__with_default__c__last__bit4))

;; discr__with_default__c__position_axiom
  (assert (<= 0 discr__with_default__c__position4))

(declare-fun user_eq5 (us_rep us_rep) Bool)

(declare-const dummy5 us_rep)

(declare-datatypes ((t6b__ref 0))
(((t6b__refqtmk (t6b__content us_rep)))))
(define-fun t6b__ref_t6b__content__projection ((a t6b__ref)) us_rep (t6b__content
                                                                    a))

(declare-const value__size5 Int)

(declare-const object__size5 Int)

(declare-const alignment5 Int)

;; value__size_axiom
  (assert (<= 0 value__size5))

;; object__size_axiom
  (assert (<= 0 object__size5))

;; alignment_axiom
  (assert (<= 0 alignment5))

(declare-const discr__with_default__c__first__bit5 Int)

(declare-const discr__with_default__c__last__bit5 Int)

(declare-const discr__with_default__c__position5 Int)

;; discr__with_default__c__first__bit_axiom
  (assert (<= 0 discr__with_default__c__first__bit5))

;; discr__with_default__c__last__bit_axiom
  (assert
  (< discr__with_default__c__first__bit5 discr__with_default__c__last__bit5))

;; discr__with_default__c__position_axiom
  (assert (<= 0 discr__with_default__c__position5))

(declare-fun user_eq6 (us_rep us_rep) Bool)

(declare-const dummy6 us_rep)

(declare-datatypes ((t7b__ref 0))
(((t7b__refqtmk (t7b__content us_rep)))))
(define-fun t7b__ref_t7b__content__projection ((a t7b__ref)) us_rep (t7b__content
                                                                    a))

(assert
;; defqtvc
 ;; File "discr.ads", line 10, characters 0-0
  (not
  (forall ((d2__split_discrs natural) (o natural) (d__split_discrs natural))
  (=> (dynamic_invariant c true false true true)
  (=> (= (to_rep o) c)
  (=> (= d__split_discrs o)
  (=> (= d__attr__constrained false)
  (=> (in_range c)
  (=> (= d1__attr__constrained true)
  (=> (default_initial_assumption1 (us_repqtmk d1__split_discrs) false)
  (=> (dynamic_invariant1 (us_repqtmk d1__split_discrs) false false true
  true)
  (=> (= d2__attr__constrained false)
  (=> (default_initial_assumption
  (us_repqtmk (us_split_discrsqtmk d2__split_discrs)) false)
  (=> (not (= d__attr__constrained true)) (= d1__attr__constrained true)))))))))))))))
(check-sat)
(exit)
