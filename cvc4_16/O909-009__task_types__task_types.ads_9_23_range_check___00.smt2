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

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk (rec__task_types__my_task_type__c natural)))))
(define-fun us_split_discrs_rec__task_types__my_task_type__c__projection ((a us_split_discrs)) natural 
  (rec__task_types__my_task_type__c a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__task_types__my_task_type us_main_type)))))
(define-fun us_split_fields_rec__task_types__my_task_type__projection ((a us_split_fields)) us_main_type 
  (rec__task_types__my_task_type a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

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

(define-fun in_range1 ((rec__task_types__my_task_type__c1 Int)
  (a us_split_discrs)) Bool (= rec__task_types__my_task_type__c1 (to_rep
                                                                 (rec__task_types__my_task_type__c
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

(declare-const task_types__my_task_type__c__first__bit Int)

(declare-const task_types__my_task_type__c__last__bit Int)

(declare-const task_types__my_task_type__c__position Int)

;; task_types__my_task_type__c__first__bit_axiom
  (assert (<= 0 task_types__my_task_type__c__first__bit))

;; task_types__my_task_type__c__last__bit_axiom
  (assert
  (< task_types__my_task_type__c__first__bit task_types__my_task_type__c__last__bit))

;; task_types__my_task_type__c__position_axiom
  (assert (<= 0 task_types__my_task_type__c__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-datatypes ((my_task_type__ref 0))
(((my_task_type__refqtmk (my_task_type__content us_rep)))))
(define-fun my_task_type__ref_my_task_type__content__projection ((a my_task_type__ref)) us_rep 
  (my_task_type__content a))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1 (rec__task_types__my_task_type1 us_main_type)))))
(define-fun us_split_fields_rec__task_types__my_task_type__2__projection ((a us_split_fields2)) us_main_type 
  (rec__task_types__my_task_type1 a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1
  (us_split_discrs2 us_split_discrs)(us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep1)) us_split_discrs 
  (us_split_discrs2 a))

(define-fun us_rep___split_fields__2__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun to_base ((a us_rep1)) us_rep (us_repqtmk (us_split_discrs2 a)
                                         (us_split_fieldsqtmk
                                         (rec__task_types__my_task_type1
                                         (us_split_fields3 a)))))

(define-fun of_base ((r us_rep)) us_rep1 (us_repqtmk1 (us_split_discrs1 r)
                                         (us_split_fieldsqtmk1
                                         (rec__task_types__my_task_type
                                         (us_split_fields1 r)))))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-const task_types__my_task_type__c__first__bit1 Int)

(declare-const task_types__my_task_type__c__last__bit1 Int)

(declare-const task_types__my_task_type__c__position1 Int)

;; task_types__my_task_type__c__first__bit_axiom
  (assert (<= 0 task_types__my_task_type__c__first__bit1))

;; task_types__my_task_type__c__last__bit_axiom
  (assert
  (< task_types__my_task_type__c__first__bit1 task_types__my_task_type__c__last__bit1))

;; task_types__my_task_type__c__position_axiom
  (assert (<= 0 task_types__my_task_type__c__position1))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-datatypes ((s1s__ref 0))
(((s1s__refqtmk (s1s__content us_rep1)))))
(define-fun s1s__ref_s1s__content__projection ((a s1s__ref)) us_rep1 
  (s1s__content a))

(declare-const t__split_discrs us_split_discrs)

(declare-const t__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(define-fun dynamic_invariant ((temp___expr_190 us_rep1)
  (temp___is_init_186 Bool) (temp___skip_constant_187 Bool)
  (temp___do_toplevel_188 Bool)
  (temp___do_typ_inv_189 Bool)) Bool (=>
                                     (not (= temp___skip_constant_187 true))
                                     (in_range1 0
                                     (us_split_discrs1
                                     (to_base temp___expr_190)))))

(define-fun default_initial_assumption ((temp___expr_192 us_rep1)
  (temp___skip_top_level_193 Bool)) Bool (= (to_rep
                                            (rec__task_types__my_task_type__c
                                            (us_split_discrs2
                                            temp___expr_192))) 0))

(declare-datatypes ((us_split_fields4 0))
(((us_split_fieldsqtmk2 (rec__task_types__my_task_type2 us_main_type)))))
(define-fun us_split_fields_rec__task_types__my_task_type__3__projection ((a us_split_fields4)) us_main_type 
  (rec__task_types__my_task_type2 a))

(declare-datatypes ((us_split_fields__ref2 0))
(((us_split_fields__refqtmk2 (us_split_fields__content2 us_split_fields4)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref2)) us_split_fields4 
  (us_split_fields__content2 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk2
  (us_split_discrs3 us_split_discrs)(us_split_fields5 us_split_fields4)))))
(define-fun us_rep___split_discrs__3__projection ((a us_rep2)) us_split_discrs 
  (us_split_discrs3 a))

(define-fun us_rep___split_fields__3__projection ((a us_rep2)) us_split_fields4 
  (us_split_fields5 a))

(define-fun to_base1 ((a us_rep2)) us_rep (us_repqtmk (us_split_discrs3 a)
                                          (us_split_fieldsqtmk
                                          (rec__task_types__my_task_type2
                                          (us_split_fields5 a)))))

(define-fun of_base1 ((r us_rep)) us_rep2 (us_repqtmk2 (us_split_discrs1 r)
                                          (us_split_fieldsqtmk2
                                          (rec__task_types__my_task_type
                                          (us_split_fields1 r)))))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

(declare-const task_types__my_task_type__c__first__bit2 Int)

(declare-const task_types__my_task_type__c__last__bit2 Int)

(declare-const task_types__my_task_type__c__position2 Int)

;; task_types__my_task_type__c__first__bit_axiom
  (assert (<= 0 task_types__my_task_type__c__first__bit2))

;; task_types__my_task_type__c__last__bit_axiom
  (assert
  (< task_types__my_task_type__c__first__bit2 task_types__my_task_type__c__last__bit2))

;; task_types__my_task_type__c__position_axiom
  (assert (<= 0 task_types__my_task_type__c__position2))

(declare-fun user_eq3 (us_rep2 us_rep2) Bool)

(declare-datatypes ((tt2S__ref 0))
(((tt2S__refqtmk (tt2S__content us_rep2)))))
(define-fun tt2S__ref_tt2S__content__projection ((a tt2S__ref)) us_rep2 
  (tt2S__content a))

(declare-const t2__split_discrs us_split_discrs)

(declare-const t2__attr__constrained Bool)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(define-fun dynamic_invariant1 ((temp___expr_199 us_rep2)
  (temp___is_init_195 Bool) (temp___skip_constant_196 Bool)
  (temp___do_toplevel_197 Bool)
  (temp___do_typ_inv_198 Bool)) Bool (=>
                                     (not (= temp___skip_constant_196 true))
                                     (in_range1 1
                                     (us_split_discrs1
                                     (to_base1 temp___expr_199)))))

(define-fun default_initial_assumption1 ((temp___expr_201 us_rep2)
  (temp___skip_top_level_202 Bool)) Bool (= (to_rep
                                            (rec__task_types__my_task_type__c
                                            (us_split_discrs3
                                            temp___expr_201))) 1))

(declare-fun line_length (us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun line_length__function_guard (Int us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(declare-fun page_length (us_private us_private us_private us_private
  us_private us_private us_private) Int)

(declare-fun page_length__function_guard (Int us_private us_private
  us_private us_private us_private us_private us_private) Bool)

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range
                                    temp___expr_39)))

(define-fun default_initial_assumption2 ((temp___expr_183 us_rep)
  (temp___skip_top_level_184 Bool)) Bool (= (to_rep
                                            (rec__task_types__my_task_type__c
                                            (us_split_discrs1
                                            temp___expr_183))) 0))

(declare-sort count 0)

(declare-fun countqtint (count) Int)

;; count'axiom
  (assert
  (forall ((i count))
  (and (<= 0 (countqtint i)) (<= (countqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq4 (count count) Bool)

(declare-const dummy1 count)

(declare-datatypes ((count__ref 0))
(((count__refqtmk (count__content count)))))
(define-fun count__ref_count__content__projection ((a count__ref)) count 
  (count__content a))

(define-fun dynamic_invariant3 ((temp___expr_212 Int)
  (temp___is_init_208 Bool) (temp___skip_constant_209 Bool)
  (temp___do_toplevel_210 Bool)
  (temp___do_typ_inv_211 Bool)) Bool (=>
                                     (or (= temp___is_init_208 true)
                                     (<= 0 2147483647)) (in_range2
                                     temp___expr_212)))

;; line_length__post_axiom
  (assert
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private)) (! (dynamic_invariant3
  (line_length ada___ada__text_io__standard_in
  ada___ada__text_io__file_system ada___ada__text_io__standard_out
  ada___ada__text_io__standard_err ada___ada__text_io__current_in
  ada___ada__text_io__current_out ada___ada__text_io__current_err) true false
  true
  true) :pattern ((line_length ada___ada__text_io__standard_in
                  ada___ada__text_io__file_system
                  ada___ada__text_io__standard_out
                  ada___ada__text_io__standard_err
                  ada___ada__text_io__current_in
                  ada___ada__text_io__current_out
                  ada___ada__text_io__current_err)) )))

;; page_length__post_axiom
  (assert
  (forall ((ada___ada__text_io__standard_in us_private)
  (ada___ada__text_io__file_system us_private)
  (ada___ada__text_io__standard_out us_private)
  (ada___ada__text_io__standard_err us_private)
  (ada___ada__text_io__current_in us_private)
  (ada___ada__text_io__current_out us_private)
  (ada___ada__text_io__current_err us_private)) (! (dynamic_invariant3
  (page_length ada___ada__text_io__standard_in
  ada___ada__text_io__file_system ada___ada__text_io__standard_out
  ada___ada__text_io__standard_err ada___ada__text_io__current_in
  ada___ada__text_io__current_out ada___ada__text_io__current_err) true false
  true
  true) :pattern ((page_length ada___ada__text_io__standard_in
                  ada___ada__text_io__file_system
                  ada___ada__text_io__standard_out
                  ada___ada__text_io__standard_err
                  ada___ada__text_io__current_in
                  ada___ada__text_io__current_out
                  ada___ada__text_io__current_err)) )))

(assert
;; defqtvc
 ;; File "task_types.ads", line 5, characters 0-0
  (not
  (forall ((t__split_fields us_main_type))
  (=> (in_range 0)
  (=> (= t__attr__constrained true)
  (=> (default_initial_assumption
  (us_repqtmk1 t__split_discrs (us_split_fieldsqtmk1 t__split_fields)) false)
  (=> (dynamic_invariant
  (us_repqtmk1 t__split_discrs (us_split_fieldsqtmk1 t__split_fields)) false
  false true true) (in_range 1))))))))
(check-sat)
(exit)
