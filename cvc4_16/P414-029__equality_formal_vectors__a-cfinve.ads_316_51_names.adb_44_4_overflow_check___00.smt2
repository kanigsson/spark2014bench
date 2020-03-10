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

(declare-sort capacity_range 0)

(declare-fun capacity_rangeqtint (capacity_range) Int)

;; capacity_range'axiom
  (assert
  (forall ((i capacity_range))
  (and (<= 0 (capacity_rangeqtint i))
  (<= (capacity_rangeqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (capacity_range capacity_range) Bool)

(declare-const dummy capacity_range)

(declare-datatypes ((capacity_range__ref 0))
(((capacity_range__refqtmk (capacity_range__content capacity_range)))))
(define-fun capacity_range__ref_capacity_range__content__2__projection ((a capacity_range__ref)) capacity_range 
  (capacity_range__content a))

(declare-sort us_main_type 0)

(declare-fun us_main_eq (us_main_type us_main_type) Bool)

(declare-datatypes ((us_split_discrs 0))
(((us_split_discrsqtmk
  (rec__names__entry_tables__vector__capacity capacity_range)))))
(define-fun us_split_discrs_rec__names__entry_tables__vector__capacity__projection ((a us_split_discrs)) capacity_range 
  (rec__names__entry_tables__vector__capacity a))

(declare-datatypes ((us_split_discrs__ref 0))
(((us_split_discrs__refqtmk (us_split_discrs__content us_split_discrs)))))
(define-fun us_split_discrs__ref___split_discrs__content__2__projection ((a us_split_discrs__ref)) us_split_discrs 
  (us_split_discrs__content a))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk (rec__names__entry_tables__vector us_main_type)))))
(define-fun us_split_fields_rec__names__entry_tables__vector__projection ((a us_split_fields)) us_main_type 
  (rec__names__entry_tables__vector a))

(declare-datatypes ((us_split_fields__ref 0))
(((us_split_fields__refqtmk (us_split_fields__content us_split_fields)))))
(define-fun us_split_fields__ref___split_fields__content__3__projection ((a us_split_fields__ref)) us_split_fields 
  (us_split_fields__content a))

(declare-datatypes ((us_rep 0))
(((us_repqtmk
  (us_split_discrs1 us_split_discrs)(us_split_fields1 us_split_fields)))))
(define-fun us_rep___split_discrs__2__projection ((a us_rep)) us_split_discrs 
  (us_split_discrs1 a))

(define-fun us_rep___split_fields__3__projection ((a us_rep)) us_split_fields 
  (us_split_fields1 a))

(define-fun to_rep ((x capacity_range)) Int (capacity_rangeqtint x))

(declare-fun of_rep (Int) capacity_range)

;; inversion_axiom
  (assert
  (forall ((x capacity_range))
  (! (= (of_rep (to_rep x)) x) :pattern ((to_rep x)) )))

;; range_axiom
  (assert
  (forall ((x capacity_range)) (! (in_range1
  (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range1 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun in_range2 ((rec__names__entry_tables__vector__capacity1 Int)
  (a us_split_discrs)) Bool (= rec__names__entry_tables__vector__capacity1 
  (to_rep (rec__names__entry_tables__vector__capacity a))))

(declare-const value__size Int)

(declare-const object__size Int)

(declare-const alignment Int)

;; value__size_axiom
  (assert (<= 0 value__size))

;; object__size_axiom
  (assert (<= 0 object__size))

;; alignment_axiom
  (assert (<= 0 alignment))

(declare-const names__entry_tables__vector__capacity__first__bit Int)

(declare-const names__entry_tables__vector__capacity__last__bit Int)

(declare-const names__entry_tables__vector__capacity__position Int)

;; names__entry_tables__vector__capacity__first__bit_axiom
  (assert (<= 0 names__entry_tables__vector__capacity__first__bit))

;; names__entry_tables__vector__capacity__last__bit_axiom
  (assert
  (< names__entry_tables__vector__capacity__first__bit names__entry_tables__vector__capacity__last__bit))

;; names__entry_tables__vector__capacity__position_axiom
  (assert (<= 0 names__entry_tables__vector__capacity__position))

(declare-fun user_eq1 (us_rep us_rep) Bool)

(declare-const dummy1 us_rep)

(declare-datatypes ((vector__ref 0))
(((vector__refqtmk (vector__content us_rep)))))
(define-fun vector__ref_vector__content__2__projection ((a vector__ref)) us_rep 
  (vector__content a))

(define-fun capacity ((container us_rep)) Int (ite (= (distinct 0 0) true)
                                              (to_rep
                                              (rec__names__entry_tables__vector__capacity
                                              (us_split_discrs1 container)))
                                              2147483647))

(declare-fun capacity__function_guard (Int us_rep) Bool)

(define-fun dynamic_invariant ((temp___expr_459 Int)
  (temp___is_init_455 Bool) (temp___skip_constant_456 Bool)
  (temp___do_toplevel_457 Bool)
  (temp___do_typ_inv_458 Bool)) Bool (=>
                                     (or (= temp___is_init_455 true)
                                     (<= 0 2147483647)) (in_range1
                                     temp___expr_459)))

(declare-fun length (us_rep) Int)

(declare-fun length__function_guard (Int us_rep) Bool)

(declare-fun oeq (us_rep us_rep) Bool)

(declare-fun oeq__function_guard (Bool us_rep us_rep) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep) (b us_rep))
  (! (= (user_eq1 a b) (oeq a b)) :pattern ((user_eq1 a b)) )))

;; length__post_axiom
  (assert
  (forall ((container us_rep))
  (! (let ((result (length container)))
     (and (<= result (capacity container)) (dynamic_invariant result true
     false true true))) :pattern ((length container)) )))

(declare-sort us_main_type1 0)

(declare-fun us_main_eq1 (us_main_type1 us_main_type1) Bool)

(declare-sort us_rep1 0)

(declare-fun bool_eq (us_rep1 us_rep1) Bool)

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq2 (us_rep1 us_rep1) Bool)

(declare-const dummy2 us_rep1)

(declare-datatypes ((sequence__ref 0))
(((sequence__refqtmk (sequence__content us_rep1)))))
(define-fun sequence__ref_sequence__content__2__projection ((a sequence__ref)) us_rep1 
  (sequence__content a))

(declare-fun model1 (us_rep) us_rep1)

(declare-fun model__function_guard (us_rep1 us_rep) Bool)

(declare-fun length1 (us_rep1) Int)

(declare-fun length__function_guard1 (Int us_rep1) Bool)

(define-fun length2 ((x Int) (y Int)) Int (ite (<= x y) (+ (- y x) 1) 0))

(define-fun last ((container us_rep1)) Int (+ 0 (length1 container)))

(declare-fun last__function_guard (Int us_rep1) Bool)

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq3 (positive positive) Bool)

(declare-const dummy3 positive)

(declare-datatypes ((positive__ref 0))
(((positive__refqtmk (positive__content positive)))))
(define-fun positive__ref_positive__content__projection ((a positive__ref)) positive 
  (positive__content a))

(define-fun to_rep1 ((x positive)) Int (positiveqtint x))

(declare-fun of_rep1 (Int) positive)

;; inversion_axiom
  (assert
  (forall ((x positive))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x positive)) (! (in_range3 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort name_id 0)

(declare-fun name_idqtint (name_id) Int)

;; name_id'axiom
  (assert
  (forall ((i name_id))
  (and (<= 0 (name_idqtint i)) (<= (name_idqtint i) 2147483647))))

(define-fun in_range4 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq4 (name_id name_id) Bool)

(declare-const dummy4 name_id)

(declare-datatypes ((name_id__ref 0))
(((name_id__refqtmk (name_id__content name_id)))))
(define-fun name_id__ref_name_id__content__projection ((a name_id__ref)) name_id 
  (name_id__content a))

(define-fun to_rep2 ((x name_id)) Int (name_idqtint x))

(declare-fun of_rep2 (Int) name_id)

;; inversion_axiom
  (assert
  (forall ((x name_id))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x name_id)) (! (in_range4 (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-sort char_table_index 0)

(declare-fun char_table_indexqtint (char_table_index) Int)

;; char_table_index'axiom
  (assert
  (forall ((i char_table_index))
  (and (<= 0 (char_table_indexqtint i))
  (<= (char_table_indexqtint i) 2147483646))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 2147483646)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq5 (char_table_index char_table_index) Bool)

(declare-const dummy5 char_table_index)

(declare-datatypes ((char_table_index__ref 0))
(((char_table_index__refqtmk (char_table_index__content char_table_index)))))
(define-fun char_table_index__ref_char_table_index__content__projection ((a char_table_index__ref)) char_table_index 
  (char_table_index__content a))

(define-fun to_rep3 ((x char_table_index)) Int (char_table_indexqtint x))

(declare-fun of_rep3 (Int) char_table_index)

;; inversion_axiom
  (assert
  (forall ((x char_table_index))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x char_table_index)) (! (in_range5
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__names__name_entry__table_index char_table_index)(rec__names__name_entry__length positive)(rec__names__name_entry__next_hash name_id)))))
(define-fun us_split_fields_rec__names__name_entry__table_index__projection ((a us_split_fields2)) char_table_index 
  (rec__names__name_entry__table_index a))

(define-fun us_split_fields_rec__names__name_entry__length__projection ((a us_split_fields2)) positive 
  (rec__names__name_entry__length a))

(define-fun us_split_fields_rec__names__name_entry__next_hash__projection ((a us_split_fields2)) name_id 
  (rec__names__name_entry__next_hash a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__2__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep2 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__2__projection ((a us_rep2)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq1 ((a us_rep2)
  (b us_rep2)) Bool (ite (and
                         (and
                         (= (to_rep3
                            (rec__names__name_entry__table_index
                            (us_split_fields3 a))) (to_rep3
                                                   (rec__names__name_entry__table_index
                                                   (us_split_fields3 b))))
                         (= (to_rep1
                            (rec__names__name_entry__length
                            (us_split_fields3 a))) (to_rep1
                                                   (rec__names__name_entry__length
                                                   (us_split_fields3 b)))))
                         (= (to_rep2
                            (rec__names__name_entry__next_hash
                            (us_split_fields3 a))) (to_rep2
                                                   (rec__names__name_entry__next_hash
                                                   (us_split_fields3 b)))))
                    true false))

(declare-const value__size2 Int)

(declare-const object__size2 Int)

(declare-const alignment2 Int)

;; value__size_axiom
  (assert (<= 0 value__size2))

;; object__size_axiom
  (assert (<= 0 object__size2))

;; alignment_axiom
  (assert (<= 0 alignment2))

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

(declare-fun user_eq6 (us_rep2 us_rep2) Bool)

(declare-const dummy6 us_rep2)

(declare-datatypes ((name_entry__ref 0))
(((name_entry__refqtmk (name_entry__content us_rep2)))))
(define-fun name_entry__ref_name_entry__content__projection ((a name_entry__ref)) us_rep2 
  (name_entry__content a))

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content us_rep2)))))
(define-fun element_type__ref_element_type__content__4__projection ((a element_type__ref)) us_rep2 
  (element_type__content a))

(declare-fun get (us_rep1 Int) us_rep2)

(declare-fun get__function_guard (us_rep2 us_rep1 Int) Bool)

(define-fun oeq1 ((left us_rep1)
  (right us_rep1)) Bool (and (= (length1 left) (length1 right)) (ite 
                                                                (forall
                                                                ((n Int))
                                                                (=>
                                                                (and (<= 1 n)
                                                                (<= n 
                                                                (last left)))
                                                                (= (bool_eq1
                                                                   (get left
                                                                   n)
                                                                   (get right
                                                                   n)) true)))
                                                                true false)))

(declare-fun oeq__function_guard1 (Bool us_rep1 us_rep1) Bool)

;; user_eq__def_axiom
  (assert
  (forall ((a us_rep1) (b us_rep1))
  (! (= (user_eq2 a b) (oeq1 a b)) :pattern ((user_eq2 a b)) )))

(define-fun default_initial_assumption ((temp___expr_497 us_rep1)
  (temp___skip_top_level_498 Bool)) Bool (=>
                                         (not
                                         (= temp___skip_top_level_498 true))
                                         (= (length1 temp___expr_497) 0)))

;; model__post_axiom
  (assert
  (forall ((container us_rep))
  (! (= (length1 (model1 container)) (length container)) :pattern ((model1
                                                                   container)) )))

(define-fun last_index ((container us_rep)) Int (last (model1 container)))

(declare-fun last_index__function_guard (Int us_rep) Bool)

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i))
  (<= (extended_indexqtint i) 2147483647))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq7 (extended_index extended_index) Bool)

(declare-const dummy7 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__3__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun dynamic_invariant1 ((temp___expr_452 Int)
  (temp___is_init_448 Bool) (temp___skip_constant_449 Bool)
  (temp___do_toplevel_450 Bool)
  (temp___do_typ_inv_451 Bool)) Bool (=>
                                     (or (= temp___is_init_448 true)
                                     (<= 0 2147483647)) (in_range6
                                     temp___expr_452)))

(declare-const container__split_discrs us_split_discrs)

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const before Int)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const new_item us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-sort tcount_typeB 0)

(declare-fun tcount_typeBqtint (tcount_typeB) Int)

;; tcount_typeB'axiom
  (assert
  (forall ((i tcount_typeB))
  (and (<= (- 2147483648) (tcount_typeBqtint i))
  (<= (tcount_typeBqtint i) 2147483647))))

(define-fun in_range7 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq8 (tcount_typeB tcount_typeB) Bool)

(declare-const dummy8 tcount_typeB)

(declare-datatypes ((tcount_typeB__ref 0))
(((tcount_typeB__refqtmk (tcount_typeB__content tcount_typeB)))))
(define-fun tcount_typeB__ref_tcount_typeB__content__projection ((a tcount_typeB__ref)) tcount_typeB 
  (tcount_typeB__content a))

(define-fun dynamic_invariant2 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant3 ((temp___expr_337 Int)
  (temp___is_init_333 Bool) (temp___skip_constant_334 Bool)
  (temp___do_toplevel_335 Bool)
  (temp___do_typ_inv_336 Bool)) Bool (=>
                                     (or (= temp___is_init_333 true)
                                     (<= 0 2147483646)) (in_range5
                                     temp___expr_337)))

(define-fun dynamic_invariant4 ((temp___expr_282 Int)
  (temp___is_init_278 Bool) (temp___skip_constant_279 Bool)
  (temp___do_toplevel_280 Bool)
  (temp___do_typ_inv_281 Bool)) Bool (=>
                                     (or (= temp___is_init_278 true)
                                     (<= 0 2147483647)) (in_range4
                                     temp___expr_282)))

(declare-sort count_type 0)

(declare-fun count_typeqtint (count_type) Int)

;; count_type'axiom
  (assert
  (forall ((i count_type))
  (and (<= 0 (count_typeqtint i)) (<= (count_typeqtint i) 2147483647))))

(define-fun in_range8 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq9 (count_type count_type) Bool)

(declare-const dummy9 count_type)

(declare-datatypes ((count_type__ref 0))
(((count_type__refqtmk (count_type__content count_type)))))
(define-fun count_type__ref_count_type__content__projection ((a count_type__ref)) count_type 
  (count_type__content a))

(define-fun dynamic_invariant5 ((temp___expr_365 Int)
  (temp___is_init_361 Bool) (temp___skip_constant_362 Bool)
  (temp___do_toplevel_363 Bool)
  (temp___do_typ_inv_364 Bool)) Bool (=>
                                     (or (= temp___is_init_361 true)
                                     (<= 0 2147483647)) (in_range8
                                     temp___expr_365)))

;; oeq__post_axiom
  (assert
  (forall ((left us_rep) (right us_rep))
  (! (= (= (oeq left right) true)
     (= (oeq1 (model1 left) (model1 right)) true)) :pattern ((oeq left right)) )))

(declare-sort extended_index1 0)

(declare-fun extended_indexqtint1 (extended_index1) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index1))
  (and (<= 0 (extended_indexqtint1 i))
  (<= (extended_indexqtint1 i) 2147483647))))

(define-fun in_range9 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE8 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check8 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE8 (us_image) Int)

(declare-fun user_eq10 (extended_index1 extended_index1) Bool)

(declare-const dummy10 extended_index1)

(declare-datatypes ((extended_index__ref1 0))
(((extended_index__refqtmk1 (extended_index__content1 extended_index1)))))
(define-fun extended_index__ref_extended_index__content__4__projection ((a extended_index__ref1)) extended_index1 
  (extended_index__content1 a))

(define-fun dynamic_invariant6 ((temp___expr_489 Int)
  (temp___is_init_485 Bool) (temp___skip_constant_486 Bool)
  (temp___do_toplevel_487 Bool)
  (temp___do_typ_inv_488 Bool)) Bool (=>
                                     (or (= temp___is_init_485 true)
                                     (<= 0 2147483647)) (in_range9
                                     temp___expr_489)))

;; length__post_axiom
  (assert
  (forall ((container us_rep1))
  (! (let ((result (length1 container)))
     (and (<= (+ 0 result) 2147483647) (dynamic_invariant5 result true false
     true true))) :pattern ((length1 container)) )))

;; get__post_axiom
  (assert true)

(assert
;; defqtvc
 ;; File "a-cfinve.ads", line 309, characters 0-0
  (not
  (forall ((container__split_fields us_main_type))
  (=> (dynamic_invariant1 before true false true true)
  (=>
  (or (= before 0)
  (let ((o (us_repqtmk container__split_discrs
           (us_split_fieldsqtmk container__split_fields))))
  (let ((o1 (last_index o)))
  (and (dynamic_invariant1 o1 true false true true) (= o1 (last (model1 o)))))))
  (let ((o (us_repqtmk container__split_discrs
           (us_split_fieldsqtmk container__split_fields))))
  (let ((o1 (last_index o)))
  (=>
  (and (dynamic_invariant1 o1 true false true true) (= o1 (last (model1 o))))
  (let ((o2 new_item))
  (let ((o3 (length o2)))
  (=> (and (dynamic_invariant o3 true false true true) (<= o3 (capacity o2)))
  (let ((o4 (capacity
            (us_repqtmk container__split_discrs
            (us_split_fieldsqtmk container__split_fields)))))
  (=>
  (and (dynamic_invariant o4 true false true true)
  (= o4 (ite (= (distinct 0 0) true)
        (to_rep
        (rec__names__entry_tables__vector__capacity container__split_discrs))
        2147483647)))
  (in_range7 (- o4 o3)))))))))))))))
(check-sat)
(exit)
