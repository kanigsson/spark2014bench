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

(define-fun in_range ((x Int)) Bool (or (= x 0) (= x 1)))

(declare-fun attr__ATTRIBUTE_IMAGE (Bool) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE (us_image) Bool)

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

(declare-fun user_eq (natural natural) Bool)

(declare-const dummy natural)

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

(declare-datatypes ()
((us_split_discrs
 (us_split_discrsqtmk (rec__record_equality__root__c natural)))))
(define-fun us_split_discrs_rec__record_equality__root__c__projection ((a us_split_discrs)) natural 
  (rec__record_equality__root__c a))

(declare-datatypes ()
((us_split_discrs__ref
 (us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ()
((us_split_fields
 (us_split_fieldsqtmk
 (rec__record_equality__root__f1 natural)(rec__ext__ us_private)))))
(define-fun us_split_fields_rec__record_equality__root__f1__projection ((a us_split_fields)) natural 
  (rec__record_equality__root__f1 a))

(define-fun us_split_fields_rec__ext____projection ((a us_split_fields)) us_private 
  (rec__ext__ a))

(declare-datatypes ()
((us_split_fields__ref
 (us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ()
((us_rep
 (us_repqtmk
 (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)(attr__tag Int)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun us_rep_attr__tag__projection ((a us_rep)) Int (attr__tag a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (= (to_rep
                           (rec__record_equality__root__c
                           (us_split_discrs1 a))) (to_rep
                                                  (rec__record_equality__root__c
                                                  (us_split_discrs1 b))))
                        (= (to_rep
                           (rec__record_equality__root__f1
                           (us_split_fields1 a))) (to_rep
                                                  (rec__record_equality__root__f1
                                                  (us_split_fields1 b)))))
                   true false))

(declare-fun us_dispatch_eq (us_rep us_rep) Bool)

(declare-const us_tag Int)

(define-fun in_range2 ((rec__record_equality__root__c1 Int)
  (a us_split_discrs)) Bool (= rec__record_equality__root__c1 (to_rep
                                                              (rec__record_equality__root__c
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

(declare-const record_equality__root__c__first__bit Int)

(declare-const record_equality__root__c__last__bit Int)

(declare-const record_equality__root__c__position Int)

;; record_equality__root__c__first__bit_axiom
  (assert (<= 0 record_equality__root__c__first__bit))

;; record_equality__root__c__last__bit_axiom
  (assert
  (< record_equality__root__c__first__bit record_equality__root__c__last__bit))

;; record_equality__root__c__position_axiom
  (assert (<= 0 record_equality__root__c__position))

(declare-const record_equality__root__f1__first__bit Int)

(declare-const record_equality__root__f1__last__bit Int)

(declare-const record_equality__root__f1__position Int)

;; record_equality__root__f1__first__bit_axiom
  (assert (<= 0 record_equality__root__f1__first__bit))

;; record_equality__root__f1__last__bit_axiom
  (assert
  (< record_equality__root__f1__first__bit record_equality__root__f1__last__bit))

;; record_equality__root__f1__position_axiom
  (assert (<= 0 record_equality__root__f1__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes () ((root__ref (root__refqtmk (root__content us_rep)))))
(define-fun root__ref_root__content__projection ((a root__ref)) us_rep 
  (root__content a))

(declare-datatypes ()
((us_split_fields2
 (us_split_fieldsqtmk1
 (rec__record_equality__child__f2 natural)(rec__record_equality__root__f11 natural)(rec__ext__1 us_private)))))
(define-fun us_split_fields_rec__record_equality__child__f2__projection ((a us_split_fields2)) natural 
  (rec__record_equality__child__f2 a))

(define-fun us_split_fields_rec__record_equality__root__f1__2__projection ((a us_split_fields2)) natural 
  (rec__record_equality__root__f11 a))

(define-fun us_split_fields_rec__ext____2__projection ((a us_split_fields2)) us_private 
  (rec__ext__1 a))

(declare-datatypes ()
((us_split_fields__ref1
 (us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ()
((us_rep1
 (us_repqtmk1
 (us_split_discrs2 us_split_discrs)(us_split_fields3 us_split_fields2)(attr__tag1 Int)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs2 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun us_rep_attr__tag__2__projection ((a us_rep1)) Int (attr__tag1 a))

(declare-fun hide_ext__ (natural us_private) us_private)

(declare-fun extract__record_equality__child__f2 (us_private) natural)

;; extract__record_equality__child__f2__conv
  (assert
  (forall ((record_equality__child__f2 natural))
  (forall ((rec__ext__2 us_private))
  (= (extract__record_equality__child__f2
     (hide_ext__ record_equality__child__f2 rec__ext__2)) record_equality__child__f2))))

(declare-fun extract__ext__ (us_private) us_private)

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk (us_split_discrs2 a)
                                         (us_split_fieldsqtmk
                                         (rec__record_equality__root__f11
                                         (us_split_fields3 a))
                                         (hide_ext__
                                         (rec__record_equality__child__f2
                                         (us_split_fields3 a))
                                         (rec__ext__1 (us_split_fields3 a))))
                                         (attr__tag1 a)))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1 (us_split_discrs1 r)
                                         (us_split_fieldsqtmk1
                                         (extract__record_equality__child__f2
                                         (rec__ext__ (us_split_fields1 r)))
                                         (rec__record_equality__root__f1
                                         (us_split_fields1 r))
                                         (extract__ext__
                                         (rec__ext__ (us_split_fields1 r))))
                                         (attr__tag r)))

(define-fun bool_eq1 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (= (to_rep
                            (rec__record_equality__root__c
                            (us_split_discrs2 a))) (to_rep
                                                   (rec__record_equality__root__c
                                                   (us_split_discrs2 b))))
                         (and
                         (= (to_rep
                            (rec__record_equality__child__f2
                            (us_split_fields3 a))) (to_rep
                                                   (rec__record_equality__child__f2
                                                   (us_split_fields3 b))))
                         (= (to_rep
                            (rec__record_equality__root__f11
                            (us_split_fields3 a))) (to_rep
                                                   (rec__record_equality__root__f11
                                                   (us_split_fields3 b))))))
                    true false))

(declare-const us_tag1 Int)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const record_equality__root__c__first__bit1 Int)

(declare-const record_equality__root__c__last__bit1 Int)

(declare-const record_equality__root__c__position1 Int)

;; record_equality__root__c__first__bit_axiom
  (assert (<= 0 record_equality__root__c__first__bit1))

;; record_equality__root__c__last__bit_axiom
  (assert
  (< record_equality__root__c__first__bit1 record_equality__root__c__last__bit1))

;; record_equality__root__c__position_axiom
  (assert (<= 0 record_equality__root__c__position1))

(declare-const record_equality__child__f2__first__bit Int)

(declare-const record_equality__child__f2__last__bit Int)

(declare-const record_equality__child__f2__position Int)

;; record_equality__child__f2__first__bit_axiom
  (assert (<= 0 record_equality__child__f2__first__bit))

;; record_equality__child__f2__last__bit_axiom
  (assert
  (< record_equality__child__f2__first__bit record_equality__child__f2__last__bit))

;; record_equality__child__f2__position_axiom
  (assert (<= 0 record_equality__child__f2__position))

(declare-const record_equality__root__f1__first__bit1 Int)

(declare-const record_equality__root__f1__last__bit1 Int)

(declare-const record_equality__root__f1__position1 Int)

;; record_equality__root__f1__first__bit_axiom
  (assert (<= 0 record_equality__root__f1__first__bit1))

;; record_equality__root__f1__last__bit_axiom
  (assert
  (< record_equality__root__f1__first__bit1 record_equality__root__f1__last__bit1))

;; record_equality__root__f1__position_axiom
  (assert (<= 0 record_equality__root__f1__position1))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ()
((child__ref (child__refqtmk (child__content us_rep1)))))
(define-fun child__ref_child__content__projection ((a child__ref)) us_rep1 
  (child__content a))

(declare-datatypes ()
((us_split_fields4
 (us_split_fieldsqtmk2
 (rec__record_equality__grandchild__f3 natural)(rec__record_equality__root__f12 natural)(rec__record_equality__child__f21 natural)(rec__ext__2 us_private)))))
(define-fun us_split_fields_rec__record_equality__grandchild__f3__projection ((a us_split_fields4)) natural 
  (rec__record_equality__grandchild__f3 a))

(define-fun us_split_fields_rec__record_equality__root__f1__3__projection ((a us_split_fields4)) natural 
  (rec__record_equality__root__f12 a))

(define-fun us_split_fields_rec__record_equality__child__f2__2__projection ((a us_split_fields4)) natural 
  (rec__record_equality__child__f21 a))

(define-fun us_split_fields_rec__ext____3__projection ((a us_split_fields4)) us_private 
  (rec__ext__2 a))

(declare-datatypes ()
((us_split_fields__ref2
 (us_split_fields__refqtmk2 (us_split_fields__content2 us_split_fields4)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref2)) us_split_fields4 
  (us_split_fields__content2 a))

(declare-datatypes ()
((us_rep2
 (us_repqtmk2
 (us_split_discrs3 us_split_discrs)(us_split_fields5 us_split_fields4)(attr__tag2 Int)))))
(define-fun us_rep___split_discrs__3__projection ((a us_rep2)) us_split_discrs 
  (us_split_discrs3 a))

(define-fun us_rep___split_fields__3__projection ((a us_rep2)) us_split_fields4 
  (us_split_fields5 a))

(define-fun us_rep_attr__tag__3__projection ((a us_rep2)) Int (attr__tag2 a))

(declare-fun hide_ext__1 (natural natural us_private) us_private)

(declare-fun extract__record_equality__grandchild__f3 (us_private) natural)

;; extract__record_equality__grandchild__f3__conv
  (assert
  (forall ((record_equality__grandchild__f3 natural)
  (record_equality__grandchild__f2 natural))
  (forall ((rec__ext__3 us_private))
  (= (extract__record_equality__grandchild__f3
     (hide_ext__1 record_equality__grandchild__f3
     record_equality__grandchild__f2 rec__ext__3)) record_equality__grandchild__f3))))

;; extract__record_equality__child__f2__conv
  (assert
  (forall ((record_equality__grandchild__f3 natural)
  (record_equality__grandchild__f2 natural))
  (forall ((rec__ext__3 us_private))
  (= (extract__record_equality__child__f2
     (hide_ext__1 record_equality__grandchild__f3
     record_equality__grandchild__f2 rec__ext__3)) record_equality__grandchild__f2))))

(declare-fun extract__ext__1 (us_private) us_private)

(define-fun to_base1 ((a us_rep2)) us_rep (us_repqtmk (us_split_discrs3 a)
                                          (us_split_fieldsqtmk
                                          (rec__record_equality__root__f12
                                          (us_split_fields5 a))
                                          (hide_ext__1
                                          (rec__record_equality__grandchild__f3
                                          (us_split_fields5 a))
                                          (rec__record_equality__child__f21
                                          (us_split_fields5 a))
                                          (rec__ext__2 (us_split_fields5 a))))
                                          (attr__tag2 a)))

(define-fun of_base1 ((r us_rep)) us_rep2 (us_repqtmk2 (us_split_discrs1 r)
                                          (us_split_fieldsqtmk2
                                          (extract__record_equality__grandchild__f3
                                          (rec__ext__ (us_split_fields1 r)))
                                          (rec__record_equality__root__f1
                                          (us_split_fields1 r))
                                          (extract__record_equality__child__f2
                                          (rec__ext__ (us_split_fields1 r)))
                                          (extract__ext__1
                                          (rec__ext__ (us_split_fields1 r))))
                                          (attr__tag r)))

(define-fun bool_eq2 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (= (to_rep
                            (rec__record_equality__root__c
                            (us_split_discrs3 a))) (to_rep
                                                   (rec__record_equality__root__c
                                                   (us_split_discrs3 b))))
                         (and
                         (and
                         (= (to_rep
                            (rec__record_equality__grandchild__f3
                            (us_split_fields5 a))) (to_rep
                                                   (rec__record_equality__grandchild__f3
                                                   (us_split_fields5 b))))
                         (= (to_rep
                            (rec__record_equality__root__f12
                            (us_split_fields5 a))) (to_rep
                                                   (rec__record_equality__root__f12
                                                   (us_split_fields5 b)))))
                         (= (to_rep
                            (rec__record_equality__child__f21
                            (us_split_fields5 a))) (to_rep
                                                   (rec__record_equality__child__f21
                                                   (us_split_fields5 b))))))
                    true false))

(declare-const us_tag2 Int)

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const record_equality__root__c__first__bit2 Int)

(declare-const record_equality__root__c__last__bit2 Int)

(declare-const record_equality__root__c__position2 Int)

;; record_equality__root__c__first__bit_axiom
  (assert (<= 0 record_equality__root__c__first__bit2))

;; record_equality__root__c__last__bit_axiom
  (assert
  (< record_equality__root__c__first__bit2 record_equality__root__c__last__bit2))

;; record_equality__root__c__position_axiom
  (assert (<= 0 record_equality__root__c__position2))

(declare-const record_equality__grandchild__f3__first__bit Int)

(declare-const record_equality__grandchild__f3__last__bit Int)

(declare-const record_equality__grandchild__f3__position Int)

;; record_equality__grandchild__f3__first__bit_axiom
  (assert (<= 0 record_equality__grandchild__f3__first__bit))

;; record_equality__grandchild__f3__last__bit_axiom
  (assert
  (< record_equality__grandchild__f3__first__bit record_equality__grandchild__f3__last__bit))

;; record_equality__grandchild__f3__position_axiom
  (assert (<= 0 record_equality__grandchild__f3__position))

(declare-const record_equality__root__f1__first__bit2 Int)

(declare-const record_equality__root__f1__last__bit2 Int)

(declare-const record_equality__root__f1__position2 Int)

;; record_equality__root__f1__first__bit_axiom
  (assert (<= 0 record_equality__root__f1__first__bit2))

;; record_equality__root__f1__last__bit_axiom
  (assert
  (< record_equality__root__f1__first__bit2 record_equality__root__f1__last__bit2))

;; record_equality__root__f1__position_axiom
  (assert (<= 0 record_equality__root__f1__position2))

(declare-const record_equality__child__f2__first__bit1 Int)

(declare-const record_equality__child__f2__last__bit1 Int)

(declare-const record_equality__child__f2__position1 Int)

;; record_equality__child__f2__first__bit_axiom
  (assert (<= 0 record_equality__child__f2__first__bit1))

;; record_equality__child__f2__last__bit_axiom
  (assert
  (< record_equality__child__f2__first__bit1 record_equality__child__f2__last__bit1))

;; record_equality__child__f2__position_axiom
  (assert (<= 0 record_equality__child__f2__position1))

(declare-fun user_eq3 (us_rep2 us_rep2) Bool)

(declare-const dummy3 us_rep2)

(declare-datatypes ()
((grandchild__ref (grandchild__refqtmk (grandchild__content us_rep2)))))
(define-fun grandchild__ref_grandchild__content__projection ((a grandchild__ref)) us_rep2 
  (grandchild__content a))

(declare-const us_tag3 Int)

(declare-const value__size3 Int)

(declare-const object__size3 Int)

(declare-const alignment3 Int)

;; value__size_axiom
  (assert (<= 0 value__size3))

;; object__size_axiom
  (assert (<= 0 object__size3))

;; alignment_axiom
  (assert (<= 0 alignment3))

(declare-const record_equality__root__c__first__bit3 Int)

(declare-const record_equality__root__c__last__bit3 Int)

(declare-const record_equality__root__c__position3 Int)

;; record_equality__root__c__first__bit_axiom
  (assert (<= 0 record_equality__root__c__first__bit3))

;; record_equality__root__c__last__bit_axiom
  (assert
  (< record_equality__root__c__first__bit3 record_equality__root__c__last__bit3))

;; record_equality__root__c__position_axiom
  (assert (<= 0 record_equality__root__c__position3))

(declare-const record_equality__root__f1__first__bit3 Int)

(declare-const record_equality__root__f1__last__bit3 Int)

(declare-const record_equality__root__f1__position3 Int)

;; record_equality__root__f1__first__bit_axiom
  (assert (<= 0 record_equality__root__f1__first__bit3))

;; record_equality__root__f1__last__bit_axiom
  (assert
  (< record_equality__root__f1__first__bit3 record_equality__root__f1__last__bit3))

;; record_equality__root__f1__position_axiom
  (assert (<= 0 record_equality__root__f1__position3))

(declare-const record_equality__child__f2__first__bit2 Int)

(declare-const record_equality__child__f2__last__bit2 Int)

(declare-const record_equality__child__f2__position2 Int)

;; record_equality__child__f2__first__bit_axiom
  (assert (<= 0 record_equality__child__f2__first__bit2))

;; record_equality__child__f2__last__bit_axiom
  (assert
  (< record_equality__child__f2__first__bit2 record_equality__child__f2__last__bit2))

;; record_equality__child__f2__position_axiom
  (assert (<= 0 record_equality__child__f2__position2))

(declare-fun user_eq4 (us_rep1 us_rep1) Bool)

(declare-const dummy4 us_rep1)

(declare-datatypes ()
((tc_pu1S__ref (tc_pu1S__refqtmk (tc_pu1S__content us_rep1)))))
(define-fun tc_pu1S__ref_tc_pu1S__content__5__projection ((a tc_pu1S__ref)) us_rep1 
  (tc_pu1S__content a))

(declare-const c_pu1__split_discrs us_split_discrs)

(declare-const c_pu1__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant1 ((temp___expr_263 us_rep1)
  (temp___is_init_259 Bool) (temp___skip_constant_260 Bool)
  (temp___do_toplevel_261 Bool)
  (temp___do_typ_inv_262 Bool)) Bool (=>
                                     (not (= temp___skip_constant_260 true))
                                     (in_range2 0
                                     (us_split_discrs1
                                     (to_base temp___expr_263)))))

(define-fun default_initial_assumption ((temp___expr_265 us_rep1)
  (temp___skip_top_level_266 Bool)) Bool (and
                                         (= (attr__tag1 temp___expr_265) 
                                         us_tag3)
                                         (and
                                         (= (to_rep
                                            (rec__record_equality__root__c
                                            (us_split_discrs2
                                            temp___expr_265))) 0)
                                         (and
                                         (= (to_rep
                                            (rec__record_equality__root__f11
                                            (us_split_fields3
                                            temp___expr_265))) 0)
                                         (= (to_rep
                                            (rec__record_equality__child__f2
                                            (us_split_fields3
                                            temp___expr_265))) 0)))))

(declare-const r14b Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const g_pu1__split_discrs us_split_discrs)

(declare-const g_pu1__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const r16b Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const g_pu2__split_discrs us_split_discrs)

(declare-const g_pu2__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-const r_g1__split_discrs us_split_discrs)

(declare-const r_g1__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS5 Int)

(declare-const r_g2__split_discrs us_split_discrs)

(declare-const r_g2__attr__tag Int)

(declare-const attr__ATTRIBUTE_ADDRESS6 Int)

(declare-const us_tag4 Int)

(declare-const value__size4 Int)

(declare-const object__size4 Int)

(declare-const alignment4 Int)

;; value__size_axiom
  (assert (<= 0 value__size4))

;; object__size_axiom
  (assert (<= 0 object__size4))

;; alignment_axiom
  (assert (<= 0 alignment4))

(declare-const record_equality__root__c__first__bit4 Int)

(declare-const record_equality__root__c__last__bit4 Int)

(declare-const record_equality__root__c__position4 Int)

;; record_equality__root__c__first__bit_axiom
  (assert (<= 0 record_equality__root__c__first__bit4))

;; record_equality__root__c__last__bit_axiom
  (assert
  (< record_equality__root__c__first__bit4 record_equality__root__c__last__bit4))

;; record_equality__root__c__position_axiom
  (assert (<= 0 record_equality__root__c__position4))

(declare-const record_equality__root__f1__first__bit4 Int)

(declare-const record_equality__root__f1__last__bit4 Int)

(declare-const record_equality__root__f1__position4 Int)

;; record_equality__root__f1__first__bit_axiom
  (assert (<= 0 record_equality__root__f1__first__bit4))

;; record_equality__root__f1__last__bit_axiom
  (assert
  (< record_equality__root__f1__first__bit4 record_equality__root__f1__last__bit4))

;; record_equality__root__f1__position_axiom
  (assert (<= 0 record_equality__root__f1__position4))

(declare-const record_equality__child__f2__first__bit3 Int)

(declare-const record_equality__child__f2__last__bit3 Int)

(declare-const record_equality__child__f2__position3 Int)

;; record_equality__child__f2__first__bit_axiom
  (assert (<= 0 record_equality__child__f2__first__bit3))

;; record_equality__child__f2__last__bit_axiom
  (assert
  (< record_equality__child__f2__first__bit3 record_equality__child__f2__last__bit3))

;; record_equality__child__f2__position_axiom
  (assert (<= 0 record_equality__child__f2__position3))

(declare-const record_equality__grandchild__f3__first__bit1 Int)

(declare-const record_equality__grandchild__f3__last__bit1 Int)

(declare-const record_equality__grandchild__f3__position1 Int)

;; record_equality__grandchild__f3__first__bit_axiom
  (assert (<= 0 record_equality__grandchild__f3__first__bit1))

;; record_equality__grandchild__f3__last__bit_axiom
  (assert
  (< record_equality__grandchild__f3__first__bit1 record_equality__grandchild__f3__last__bit1))

;; record_equality__grandchild__f3__position_axiom
  (assert (<= 0 record_equality__grandchild__f3__position1))

(declare-fun user_eq5 (us_rep2 us_rep2) Bool)

(declare-const dummy5 us_rep2)

(declare-datatypes () ((t13b__ref (t13b__refqtmk (t13b__content us_rep2)))))
(define-fun t13b__ref_t13b__content__projection ((a t13b__ref)) us_rep2 
  (t13b__content a))

(declare-const us_tag5 Int)

(declare-const value__size5 Int)

(declare-const object__size5 Int)

(declare-const alignment5 Int)

;; value__size_axiom
  (assert (<= 0 value__size5))

;; object__size_axiom
  (assert (<= 0 object__size5))

;; alignment_axiom
  (assert (<= 0 alignment5))

(declare-const record_equality__root__c__first__bit5 Int)

(declare-const record_equality__root__c__last__bit5 Int)

(declare-const record_equality__root__c__position5 Int)

;; record_equality__root__c__first__bit_axiom
  (assert (<= 0 record_equality__root__c__first__bit5))

;; record_equality__root__c__last__bit_axiom
  (assert
  (< record_equality__root__c__first__bit5 record_equality__root__c__last__bit5))

;; record_equality__root__c__position_axiom
  (assert (<= 0 record_equality__root__c__position5))

(declare-const record_equality__root__f1__first__bit5 Int)

(declare-const record_equality__root__f1__last__bit5 Int)

(declare-const record_equality__root__f1__position5 Int)

;; record_equality__root__f1__first__bit_axiom
  (assert (<= 0 record_equality__root__f1__first__bit5))

;; record_equality__root__f1__last__bit_axiom
  (assert
  (< record_equality__root__f1__first__bit5 record_equality__root__f1__last__bit5))

;; record_equality__root__f1__position_axiom
  (assert (<= 0 record_equality__root__f1__position5))

(declare-const record_equality__child__f2__first__bit4 Int)

(declare-const record_equality__child__f2__last__bit4 Int)

(declare-const record_equality__child__f2__position4 Int)

;; record_equality__child__f2__first__bit_axiom
  (assert (<= 0 record_equality__child__f2__first__bit4))

;; record_equality__child__f2__last__bit_axiom
  (assert
  (< record_equality__child__f2__first__bit4 record_equality__child__f2__last__bit4))

;; record_equality__child__f2__position_axiom
  (assert (<= 0 record_equality__child__f2__position4))

(declare-const record_equality__grandchild__f3__first__bit2 Int)

(declare-const record_equality__grandchild__f3__last__bit2 Int)

(declare-const record_equality__grandchild__f3__position2 Int)

;; record_equality__grandchild__f3__first__bit_axiom
  (assert (<= 0 record_equality__grandchild__f3__first__bit2))

;; record_equality__grandchild__f3__last__bit_axiom
  (assert
  (< record_equality__grandchild__f3__first__bit2 record_equality__grandchild__f3__last__bit2))

;; record_equality__grandchild__f3__position_axiom
  (assert (<= 0 record_equality__grandchild__f3__position2))

(declare-fun user_eq6 (us_rep2 us_rep2) Bool)

(declare-const dummy6 us_rep2)

(declare-datatypes () ((t15b__ref (t15b__refqtmk (t15b__content us_rep2)))))
(define-fun t15b__ref_t15b__content__projection ((a t15b__ref)) us_rep2 
  (t15b__content a))

(declare-const c_pu1__split_fields us_split_fields2)

(assert
;; defqtvc
 ;; File "record_equality.ads", line 19, characters 0-0
  (not (in_range1 0)))
(check-sat)

(exit)
