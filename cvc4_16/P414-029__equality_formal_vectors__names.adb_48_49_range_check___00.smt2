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

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(define-fun dynamic_invariant ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range1
                                    temp___expr_39)))

(declare-const max_size_in_storage_elements Int)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const no_index Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const last_count Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (positive positive) Bool)

(declare-const dummy1 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
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
  (forall ((x positive)) (! (in_range2 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(declare-sort name_id 0)

(declare-fun name_idqtint (name_id) Int)

;; name_id'axiom
  (assert
  (forall ((i name_id))
  (and (<= 0 (name_idqtint i)) (<= (name_idqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (name_id name_id) Bool)

(declare-const dummy2 name_id)

(declare-datatypes ((name_id__ref 0))
(((name_id__refqtmk (name_id__content name_id)))))
(define-fun name_id__ref_name_id__content__projection ((a name_id__ref)) name_id 
  (name_id__content a))

(define-fun to_rep1 ((x name_id)) Int (name_idqtint x))

(declare-fun of_rep1 (Int) name_id)

;; inversion_axiom
  (assert
  (forall ((x name_id))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x name_id)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort char_table_index 0)

(declare-fun char_table_indexqtint (char_table_index) Int)

;; char_table_index'axiom
  (assert
  (forall ((i char_table_index))
  (and (<= 0 (char_table_indexqtint i))
  (<= (char_table_indexqtint i) 2147483646))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483646)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (char_table_index char_table_index) Bool)

(declare-const dummy3 char_table_index)

(declare-datatypes ((char_table_index__ref 0))
(((char_table_index__refqtmk (char_table_index__content char_table_index)))))
(define-fun char_table_index__ref_char_table_index__content__projection ((a char_table_index__ref)) char_table_index 
  (char_table_index__content a))

(define-fun to_rep2 ((x char_table_index)) Int (char_table_indexqtint x))

(declare-fun of_rep2 (Int) char_table_index)

;; inversion_axiom
  (assert
  (forall ((x char_table_index))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x char_table_index)) (! (in_range4
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__names__name_entry__table_index char_table_index)(rec__names__name_entry__length positive)(rec__names__name_entry__next_hash name_id)))))
(define-fun us_split_fields_rec__names__name_entry__table_index__projection ((a us_split_fields)) char_table_index 
  (rec__names__name_entry__table_index a))

(define-fun us_split_fields_rec__names__name_entry__length__projection ((a us_split_fields)) positive 
  (rec__names__name_entry__length a))

(define-fun us_split_fields_rec__names__name_entry__next_hash__projection ((a us_split_fields)) name_id 
  (rec__names__name_entry__next_hash a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk (us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun bool_eq ((a us_rep)
  (b us_rep)) Bool (ite (and
                        (and
                        (= (to_rep2
                           (rec__names__name_entry__table_index
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__names__name_entry__table_index
                                                  (us_split_fields1 b))))
                        (= (to_rep
                           (rec__names__name_entry__length
                           (us_split_fields1 a))) (to_rep
                                                  (rec__names__name_entry__length
                                                  (us_split_fields1 b)))))
                        (= (to_rep1
                           (rec__names__name_entry__next_hash
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__names__name_entry__next_hash
                                                  (us_split_fields1 b)))))
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

(declare-const names__name_entry__table_index__first__bit Int)

(declare-const names__name_entry__table_index__last__bit Int)

(declare-const names__name_entry__table_index__position Int)

;; names__name_entry__table_index__first__bit_axiom
  (assert (<= 0 names__name_entry__table_index__first__bit))

;; names__name_entry__table_index__last__bit_axiom
  (assert
  (< names__name_entry__table_index__first__bit names__name_entry__table_index__last__bit))

;; names__name_entry__table_index__position_axiom
  (assert (<= 0 names__name_entry__table_index__position))

(declare-const names__name_entry__length__first__bit Int)

(declare-const names__name_entry__length__last__bit Int)

(declare-const names__name_entry__length__position Int)

;; names__name_entry__length__first__bit_axiom
  (assert (<= 0 names__name_entry__length__first__bit))

;; names__name_entry__length__last__bit_axiom
  (assert
  (< names__name_entry__length__first__bit names__name_entry__length__last__bit))

;; names__name_entry__length__position_axiom
  (assert (<= 0 names__name_entry__length__position))

(declare-const names__name_entry__next_hash__first__bit Int)

(declare-const names__name_entry__next_hash__last__bit Int)

(declare-const names__name_entry__next_hash__position Int)

;; names__name_entry__next_hash__first__bit_axiom
  (assert (<= 0 names__name_entry__next_hash__first__bit))

;; names__name_entry__next_hash__last__bit_axiom
  (assert
  (< names__name_entry__next_hash__first__bit names__name_entry__next_hash__last__bit))

;; names__name_entry__next_hash__position_axiom
  (assert (<= 0 names__name_entry__next_hash__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((name_entry__ref 0))
(((name_entry__refqtmk (name_entry__content us_rep)))))
(define-fun name_entry__ref_name_entry__content__projection ((a name_entry__ref)) us_rep 
  (name_entry__content a))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (count_type count_type) Bool)

(declare-const dummy5 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant1 ((temp___expr_365 Int)
  (temp___is_init_361 Bool) (temp___skip_constant_362 Bool)
  (temp___do_toplevel_363 Bool)
  (temp___do_typ_inv_364 Bool)) Bool (=>
                                     (or (= temp___is_init_361 true)
                                     (<= 0 2147483647)) (in_range5
                                     temp___expr_365)))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i))
  (<= (extended_indexqtint i) 2147483647))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (extended_index extended_index) Bool)

(declare-const dummy6 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__3__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant2 ((temp___expr_452 Int)
  (temp___is_init_448 Bool) (temp___skip_constant_449 Bool)
  (temp___do_toplevel_450 Bool)
  (temp___do_typ_inv_451 Bool)) Bool (=>
                                     (or (= temp___is_init_448 true)
                                     (<= 0 2147483647)) (in_range6
                                     temp___expr_452)))

(define-fun dynamic_invariant3 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range2
                                    temp___expr_46)))

(define-fun dynamic_invariant4 ((temp___expr_337 Int)
  (temp___is_init_333 Bool) (temp___skip_constant_334 Bool)
  (temp___do_toplevel_335 Bool)
  (temp___do_typ_inv_336 Bool)) Bool (=>
                                     (or (= temp___is_init_333 true)
                                     (<= 0 2147483646)) (in_range4
                                     temp___expr_337)))

(define-fun dynamic_invariant5 ((temp___expr_282 Int)
  (temp___is_init_278 Bool) (temp___skip_constant_279 Bool)
  (temp___do_toplevel_280 Bool)
  (temp___do_typ_inv_281 Bool)) Bool (=>
                                     (or (= temp___is_init_278 true)
                                     (<= 0 2147483647)) (in_range3
                                     temp___expr_282)))

;; no_index__def_axiom
  (assert (= no_index 0))

;; last_count__def_axiom
  (assert (= last_count 2147483647))

;; max_size_in_storage_elements__def_axiom
  (assert (= max_size_in_storage_elements value__size))

(assert
;; defqtvc
 ;; File "names.adb", line 44, characters 0-0
  (not (in_range1 value__size)))
(check-sat)
(exit)
