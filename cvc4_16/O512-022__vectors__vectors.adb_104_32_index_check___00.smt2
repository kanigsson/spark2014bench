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

(declare-sort integer 0)

(declare-fun integerqtint (integer) Int)

;; integer'axiom
  (assert
  (forall ((i integer))
  (and (<= (- 2147483648) (integerqtint i)) (<= (integerqtint i) 2147483647))))

(define-fun in_range1 ((x Int)) Bool (and (<= (- 2147483648) x)
                                     (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE1 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check1 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE1 (us_image) Int)

(declare-fun user_eq (integer integer) Bool)

(declare-const dummy integer)

(declare-datatypes ((integer__ref 0))
(((integer__refqtmk (integer__content integer)))))
(define-fun integer__ref_integer__content__projection ((a integer__ref)) integer 
  (integer__content a))

(declare-sort natural 0)

(declare-fun naturalqtint (natural) Int)

;; natural'axiom
  (assert
  (forall ((i natural))
  (and (<= 0 (naturalqtint i)) (<= (naturalqtint i) 2147483647))))

(define-fun in_range2 ((x Int)) Bool (and (<= 0 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE2 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check2 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE2 (us_image) Int)

(declare-fun user_eq1 (natural natural) Bool)

(declare-const dummy1 natural)

(declare-datatypes ((natural__ref 0))
(((natural__refqtmk (natural__content natural)))))
(define-fun natural__ref_natural__content__projection ((a natural__ref)) natural 
  (natural__content a))

(declare-sort positive 0)

(declare-fun positiveqtint (positive) Int)

;; positive'axiom
  (assert
  (forall ((i positive))
  (and (<= 1 (positiveqtint i)) (<= (positiveqtint i) 2147483647))))

(define-fun in_range3 ((x Int)) Bool (and (<= 1 x) (<= x 2147483647)))

(declare-fun attr__ATTRIBUTE_IMAGE3 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check3 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE3 (us_image) Int)

(declare-fun user_eq2 (positive positive) Bool)

(declare-const dummy2 positive)

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
  (forall ((x positive)) (! (in_range3 (to_rep x)) :pattern ((to_rep x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range3 x) (= (to_rep (of_rep x)) x)) :pattern ((to_rep
                                                            (of_rep x))) )))

(define-fun to_rep1 ((x natural)) Int (naturalqtint x))

(declare-fun of_rep1 (Int) natural)

;; inversion_axiom
  (assert
  (forall ((x natural))
  (! (= (of_rep1 (to_rep1 x)) x) :pattern ((to_rep1 x)) )))

;; range_axiom
  (assert
  (forall ((x natural)) (! (in_range2 (to_rep1 x)) :pattern ((to_rep1 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range2 x) (= (to_rep1 (of_rep1 x)) x)) :pattern ((to_rep1
                                                              (of_rep1 x))) )))

(declare-sort index_type 0)

(declare-fun index_typeqtint (index_type) Int)

;; index_type'axiom
  (assert
  (forall ((i index_type))
  (and (<= 1 (index_typeqtint i)) (<= (index_typeqtint i) 10000))))

(define-fun in_range4 ((x Int)) Bool (and (<= 1 x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE4 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check4 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE4 (us_image) Int)

(declare-fun user_eq3 (index_type index_type) Bool)

(declare-const dummy3 index_type)

(declare-datatypes ((index_type__ref 0))
(((index_type__refqtmk (index_type__content index_type)))))
(define-fun index_type__ref_index_type__content__projection ((a index_type__ref)) index_type 
  (index_type__content a))

(define-fun to_rep2 ((x index_type)) Int (index_typeqtint x))

(declare-fun of_rep2 (Int) index_type)

;; inversion_axiom
  (assert
  (forall ((x index_type))
  (! (= (of_rep2 (to_rep2 x)) x) :pattern ((to_rep2 x)) )))

;; range_axiom
  (assert
  (forall ((x index_type)) (! (in_range4
  (to_rep2 x)) :pattern ((to_rep2 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range4 x) (= (to_rep2 (of_rep2 x)) x)) :pattern ((to_rep2
                                                              (of_rep2 x))) )))

(declare-datatypes ((us_split_fields 0))
(((us_split_fieldsqtmk
  (rec__vectors__cursor__container_id natural)(rec__vectors__cursor__container_sig natural)(rec__vectors__cursor__last_index index_type)(rec__vectors__cursor__index index_type)))))
(define-fun us_split_fields_rec__vectors__cursor__container_id__projection ((a us_split_fields)) natural 
  (rec__vectors__cursor__container_id a))

(define-fun us_split_fields_rec__vectors__cursor__container_sig__projection ((a us_split_fields)) natural 
  (rec__vectors__cursor__container_sig a))

(define-fun us_split_fields_rec__vectors__cursor__last_index__projection ((a us_split_fields)) index_type 
  (rec__vectors__cursor__last_index a))

(define-fun us_split_fields_rec__vectors__cursor__index__projection ((a us_split_fields)) index_type 
  (rec__vectors__cursor__index a))

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
                        (= (to_rep1
                           (rec__vectors__cursor__container_id
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__vectors__cursor__container_id
                                                  (us_split_fields1 b))))
                        (= (to_rep1
                           (rec__vectors__cursor__container_sig
                           (us_split_fields1 a))) (to_rep1
                                                  (rec__vectors__cursor__container_sig
                                                  (us_split_fields1 b)))))
                        (and
                        (= (to_rep2
                           (rec__vectors__cursor__last_index
                           (us_split_fields1 a))) (to_rep2
                                                  (rec__vectors__cursor__last_index
                                                  (us_split_fields1 b))))
                        (= (to_rep2
                           (rec__vectors__cursor__index (us_split_fields1 a))) 
                        (to_rep2
                        (rec__vectors__cursor__index (us_split_fields1 b))))))
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

(declare-const vectors__cursor__container_id__first__bit Int)

(declare-const vectors__cursor__container_id__last__bit Int)

(declare-const vectors__cursor__container_id__position Int)

;; vectors__cursor__container_id__first__bit_axiom
  (assert (<= 0 vectors__cursor__container_id__first__bit))

;; vectors__cursor__container_id__last__bit_axiom
  (assert
  (< vectors__cursor__container_id__first__bit vectors__cursor__container_id__last__bit))

;; vectors__cursor__container_id__position_axiom
  (assert (<= 0 vectors__cursor__container_id__position))

(declare-const vectors__cursor__container_sig__first__bit Int)

(declare-const vectors__cursor__container_sig__last__bit Int)

(declare-const vectors__cursor__container_sig__position Int)

;; vectors__cursor__container_sig__first__bit_axiom
  (assert (<= 0 vectors__cursor__container_sig__first__bit))

;; vectors__cursor__container_sig__last__bit_axiom
  (assert
  (< vectors__cursor__container_sig__first__bit vectors__cursor__container_sig__last__bit))

;; vectors__cursor__container_sig__position_axiom
  (assert (<= 0 vectors__cursor__container_sig__position))

(declare-const vectors__cursor__last_index__first__bit Int)

(declare-const vectors__cursor__last_index__last__bit Int)

(declare-const vectors__cursor__last_index__position Int)

;; vectors__cursor__last_index__first__bit_axiom
  (assert (<= 0 vectors__cursor__last_index__first__bit))

;; vectors__cursor__last_index__last__bit_axiom
  (assert
  (< vectors__cursor__last_index__first__bit vectors__cursor__last_index__last__bit))

;; vectors__cursor__last_index__position_axiom
  (assert (<= 0 vectors__cursor__last_index__position))

(declare-const vectors__cursor__index__first__bit Int)

(declare-const vectors__cursor__index__last__bit Int)

(declare-const vectors__cursor__index__position Int)

;; vectors__cursor__index__first__bit_axiom
  (assert (<= 0 vectors__cursor__index__first__bit))

;; vectors__cursor__index__last__bit_axiom
  (assert
  (< vectors__cursor__index__first__bit vectors__cursor__index__last__bit))

;; vectors__cursor__index__position_axiom
  (assert (<= 0 vectors__cursor__index__position))

(declare-fun user_eq4 (us_rep us_rep) Bool)

(declare-const dummy4 us_rep)

(declare-datatypes ((cursor__ref 0))
(((cursor__refqtmk (cursor__content us_rep)))))
(define-fun cursor__ref_cursor__content__projection ((a cursor__ref)) us_rep 
  (cursor__content a))

(declare-sort extended_index 0)

(declare-fun extended_indexqtint (extended_index) Int)

;; extended_index'axiom
  (assert
  (forall ((i extended_index))
  (and (<= 0 (extended_indexqtint i)) (<= (extended_indexqtint i) 10000))))

(define-fun in_range5 ((x Int)) Bool (and (<= 0 x) (<= x 10000)))

(declare-fun attr__ATTRIBUTE_IMAGE5 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check5 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE5 (us_image) Int)

(declare-fun user_eq5 (extended_index extended_index) Bool)

(declare-const dummy5 extended_index)

(declare-datatypes ((extended_index__ref 0))
(((extended_index__refqtmk (extended_index__content extended_index)))))
(define-fun extended_index__ref_extended_index__content__projection ((a extended_index__ref)) extended_index 
  (extended_index__content a))

(define-fun to_rep3 ((x extended_index)) Int (extended_indexqtint x))

(declare-fun of_rep3 (Int) extended_index)

;; inversion_axiom
  (assert
  (forall ((x extended_index))
  (! (= (of_rep3 (to_rep3 x)) x) :pattern ((to_rep3 x)) )))

;; range_axiom
  (assert
  (forall ((x extended_index)) (! (in_range5
  (to_rep3 x)) :pattern ((to_rep3 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range5 x) (= (to_rep3 (of_rep3 x)) x)) :pattern ((to_rep3
                                                              (of_rep3 x))) )))

(declare-sort element_type 0)

(declare-fun element_typeqtint (element_type) Int)

;; element_type'axiom
  (assert
  (forall ((i element_type))
  (and (<= 0 (element_typeqtint i)) (<= (element_typeqtint i) 100000))))

(define-fun in_range6 ((x Int)) Bool (and (<= 0 x) (<= x 100000)))

(declare-fun attr__ATTRIBUTE_IMAGE6 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check6 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE6 (us_image) Int)

(declare-fun user_eq6 (element_type element_type) Bool)

(declare-const dummy6 element_type)

(declare-datatypes ((element_type__ref 0))
(((element_type__refqtmk (element_type__content element_type)))))
(define-fun element_type__ref_element_type__content__projection ((a element_type__ref)) element_type 
  (element_type__content a))

(define-fun to_rep4 ((x element_type)) Int (element_typeqtint x))

(declare-fun of_rep4 (Int) element_type)

;; inversion_axiom
  (assert
  (forall ((x element_type))
  (! (= (of_rep4 (to_rep4 x)) x) :pattern ((to_rep4 x)) )))

;; range_axiom
  (assert
  (forall ((x element_type)) (! (in_range6
  (to_rep4 x)) :pattern ((to_rep4 x)) )))

;; coerce_axiom
  (assert
  (forall ((x Int))
  (! (=> (in_range6 x) (= (to_rep4 (of_rep4 x)) x)) :pattern ((to_rep4
                                                              (of_rep4 x))) )))

(declare-datatypes ((map__ref 0))
(((map__refqtmk (map__content (Array Int element_type))))))
(declare-fun slide ((Array Int element_type) Int
  Int) (Array Int element_type))

;; slide_eq
  (assert
  (forall ((a (Array Int element_type)))
  (forall ((first Int))
  (! (= (slide a first first) a) :pattern ((slide a first first)) ))))

;; slide_def
  (assert
  (forall ((a (Array Int element_type)))
  (forall ((old_first Int))
  (forall ((new_first Int))
  (forall ((i Int))
  (! (= (select (slide a old_first new_first) i) (select a (- i (- new_first old_first)))) :pattern ((select 
  (slide a old_first new_first) i)) ))))))

(define-fun bool_eq1 ((a (Array Int element_type)) (a__first Int)
  (a__last Int) (b (Array Int element_type)) (b__first Int)
  (b__last Int)) Bool (ite (and
                           (ite (<= a__first a__last)
                           (and (<= b__first b__last)
                           (= (- a__last a__first) (- b__last b__first)))
                           (< b__last b__first))
                           (forall ((temp___idx_154 Int))
                           (=>
                           (and (<= a__first temp___idx_154)
                           (<= temp___idx_154 a__last))
                           (= (to_rep4 (select a temp___idx_154)) (to_rep4
                                                                  (select b (+ (- b__first a__first) temp___idx_154)))))))
                      true false))

;; bool_eq_rev
  (assert
  (forall ((a (Array Int element_type)) (b (Array Int element_type)))
  (forall ((a__first Int) (a__last Int) (b__first Int) (b__last Int))
  (=> (= (bool_eq1 b b__first b__last a a__first a__last) true)
  (and
  (ite (<= a__first a__last)
  (and (<= b__first b__last) (= (- a__last a__first) (- b__last b__first)))
  (< b__last b__first))
  (forall ((temp___idx_154 Int))
  (=> (and (<= a__first temp___idx_154) (<= temp___idx_154 a__last))
  (= (to_rep4 (select a temp___idx_154)) (to_rep4
                                         (select b (+ (- b__first a__first) temp___idx_154)))))))))))

(declare-const dummy7 (Array Int element_type))

(declare-const value__size1 Int)

(declare-const object__size1 Int)

(declare-const component__size Int)

(declare-const alignment1 Int)

;; value__size_axiom
  (assert (<= 0 value__size1))

;; object__size_axiom
  (assert (<= 0 object__size1))

;; component__size_axiom
  (assert (<= 0 component__size))

;; alignment_axiom
  (assert (<= 0 alignment1))

(declare-fun user_eq7 ((Array Int element_type)
  (Array Int element_type)) Bool)

(declare-datatypes ((us_split_fields2 0))
(((us_split_fieldsqtmk1
  (rec__vectors__vector__id natural)(rec__vectors__vector__sig positive)(rec__vectors__vector__elements (Array Int element_type))(rec__vectors__vector__last_index extended_index)))))
(define-fun us_split_fields_rec__vectors__vector__id__projection ((a us_split_fields2)) natural 
  (rec__vectors__vector__id a))

(define-fun us_split_fields_rec__vectors__vector__sig__projection ((a us_split_fields2)) positive 
  (rec__vectors__vector__sig a))

(define-fun us_split_fields_rec__vectors__vector__elements__projection ((a us_split_fields2)) (Array Int element_type) 
  (rec__vectors__vector__elements a))

(define-fun us_split_fields_rec__vectors__vector__last_index__projection ((a us_split_fields2)) extended_index 
  (rec__vectors__vector__last_index a))

(declare-datatypes ((us_split_fields__ref1 0))
(((us_split_fields__refqtmk1 (us_split_fields__content1 us_split_fields2)))))
(define-fun us_split_fields__ref___split_fields__content__projection ((a us_split_fields__ref1)) us_split_fields2 
  (us_split_fields__content1 a))

(declare-datatypes ((us_rep1 0))
(((us_repqtmk1 (us_split_fields3 us_split_fields2)))))
(define-fun us_rep___split_fields__projection ((a us_rep1)) us_split_fields2 
  (us_split_fields3 a))

(define-fun bool_eq2 ((a us_rep1)
  (b us_rep1)) Bool (ite (and
                         (and
                         (= (to_rep1
                            (rec__vectors__vector__id (us_split_fields3 a))) 
                         (to_rep1
                         (rec__vectors__vector__id (us_split_fields3 b))))
                         (= (to_rep
                            (rec__vectors__vector__sig (us_split_fields3 a))) 
                         (to_rep
                         (rec__vectors__vector__sig (us_split_fields3 b)))))
                         (and
                         (= (bool_eq1
                            (rec__vectors__vector__elements
                            (us_split_fields3 a)) 1 10000
                            (rec__vectors__vector__elements
                            (us_split_fields3 b)) 1 10000) true)
                         (= (to_rep3
                            (rec__vectors__vector__last_index
                            (us_split_fields3 a))) (to_rep3
                                                   (rec__vectors__vector__last_index
                                                   (us_split_fields3 b))))))
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

(declare-const vectors__vector__id__first__bit Int)

(declare-const vectors__vector__id__last__bit Int)

(declare-const vectors__vector__id__position Int)

;; vectors__vector__id__first__bit_axiom
  (assert (<= 0 vectors__vector__id__first__bit))

;; vectors__vector__id__last__bit_axiom
  (assert (< vectors__vector__id__first__bit vectors__vector__id__last__bit))

;; vectors__vector__id__position_axiom
  (assert (<= 0 vectors__vector__id__position))

(declare-const vectors__vector__sig__first__bit Int)

(declare-const vectors__vector__sig__last__bit Int)

(declare-const vectors__vector__sig__position Int)

;; vectors__vector__sig__first__bit_axiom
  (assert (<= 0 vectors__vector__sig__first__bit))

;; vectors__vector__sig__last__bit_axiom
  (assert
  (< vectors__vector__sig__first__bit vectors__vector__sig__last__bit))

;; vectors__vector__sig__position_axiom
  (assert (<= 0 vectors__vector__sig__position))

(declare-const vectors__vector__elements__first__bit Int)

(declare-const vectors__vector__elements__last__bit Int)

(declare-const vectors__vector__elements__position Int)

;; vectors__vector__elements__first__bit_axiom
  (assert (<= 0 vectors__vector__elements__first__bit))

;; vectors__vector__elements__last__bit_axiom
  (assert
  (< vectors__vector__elements__first__bit vectors__vector__elements__last__bit))

;; vectors__vector__elements__position_axiom
  (assert (<= 0 vectors__vector__elements__position))

(declare-const vectors__vector__last_index__first__bit Int)

(declare-const vectors__vector__last_index__last__bit Int)

(declare-const vectors__vector__last_index__position Int)

;; vectors__vector__last_index__first__bit_axiom
  (assert (<= 0 vectors__vector__last_index__first__bit))

;; vectors__vector__last_index__last__bit_axiom
  (assert
  (< vectors__vector__last_index__first__bit vectors__vector__last_index__last__bit))

;; vectors__vector__last_index__position_axiom
  (assert (<= 0 vectors__vector__last_index__position))

(declare-fun user_eq8 (us_rep1 us_rep1) Bool)

(declare-const dummy8 us_rep1)

(declare-datatypes ((vector__ref 0))
(((vector__refqtmk (vector__content us_rep1)))))
(define-fun vector__ref_vector__content__projection ((a vector__ref)) us_rep1 
  (vector__content a))

(declare-const attr__ATTRIBUTE_ADDRESS Int)

(declare-const before us_rep)

(declare-const attr__ATTRIBUTE_ADDRESS1 Int)

(declare-const new_item Int)

(declare-const attr__ATTRIBUTE_ADDRESS2 Int)

(declare-const r10b Int)

(declare-const attr__ATTRIBUTE_ADDRESS3 Int)

(declare-const attr__ATTRIBUTE_ADDRESS4 Int)

(declare-sort textended_indexB 0)

(declare-fun textended_indexBqtint (textended_indexB) Int)

;; textended_indexB'axiom
  (assert
  (forall ((i textended_indexB))
  (and (<= (- 32768) (textended_indexBqtint i))
  (<= (textended_indexBqtint i) 32767))))

(define-fun in_range7 ((x Int)) Bool (and (<= (- 32768) x) (<= x 32767)))

(declare-fun attr__ATTRIBUTE_IMAGE7 (Int) us_image)

(declare-fun attr__ATTRIBUTE_VALUE__pre_check7 (us_image) Bool)

(declare-fun attr__ATTRIBUTE_VALUE7 (us_image) Int)

(declare-fun user_eq9 (textended_indexB textended_indexB) Bool)

(declare-const dummy9 textended_indexB)

(declare-datatypes ((textended_indexB__ref 0))
(((textended_indexB__refqtmk (textended_indexB__content textended_indexB)))))
(define-fun textended_indexB__ref_textended_indexB__content__projection ((a textended_indexB__ref)) textended_indexB 
  (textended_indexB__content a))

(define-fun dynamic_invariant ((temp___expr_165 Int)
  (temp___is_init_161 Bool) (temp___skip_constant_162 Bool)
  (temp___do_toplevel_163 Bool)
  (temp___do_typ_inv_164 Bool)) Bool (=>
                                     (or (= temp___is_init_161 true)
                                     (<= 0 10000)) (in_range5
                                     temp___expr_165)))

(define-fun dynamic_invariant1 ((temp___expr_172 Int)
  (temp___is_init_168 Bool) (temp___skip_constant_169 Bool)
  (temp___do_toplevel_170 Bool)
  (temp___do_typ_inv_171 Bool)) Bool (=>
                                     (or (= temp___is_init_168 true)
                                     (<= 0 100000)) (in_range6
                                     temp___expr_172)))

(define-fun dynamic_invariant2 ((temp___expr_39 Int) (temp___is_init_35 Bool)
  (temp___skip_constant_36 Bool) (temp___do_toplevel_37 Bool)
  (temp___do_typ_inv_38 Bool)) Bool (=>
                                    (or (= temp___is_init_35 true)
                                    (<= 0 2147483647)) (in_range2
                                    temp___expr_39)))

(define-fun dynamic_invariant3 ((temp___expr_46 Int) (temp___is_init_42 Bool)
  (temp___skip_constant_43 Bool) (temp___do_toplevel_44 Bool)
  (temp___do_typ_inv_45 Bool)) Bool (=>
                                    (or (= temp___is_init_42 true)
                                    (<= 1 2147483647)) (in_range3
                                    temp___expr_46)))

(define-fun dynamic_invariant4 ((temp___expr_18 Int) (temp___is_init_14 Bool)
  (temp___skip_constant_15 Bool) (temp___do_toplevel_16 Bool)
  (temp___do_typ_inv_17 Bool)) Bool (=>
                                    (or (= temp___is_init_14 true)
                                    (<= (- 2147483648) 2147483647))
                                    (in_range1 temp___expr_18)))

(define-fun dynamic_invariant5 ((temp___expr_179 Int)
  (temp___is_init_175 Bool) (temp___skip_constant_176 Bool)
  (temp___do_toplevel_177 Bool)
  (temp___do_typ_inv_178 Bool)) Bool (=>
                                     (or (= temp___is_init_175 true)
                                     (<= 1 10000)) (in_range4
                                     temp___expr_179)))

(assert
;; defqtvc
 ;; File "vectors.ads", line 44, characters 0-0
  (not
  (forall ((container__split_fields us_split_fields2)
  (vectors__insert__L_1__R10b__assume Int) (temp___275 Int))
  (=> (dynamic_invariant1 new_item true false true true)
  (=>
  (= (to_rep3 (rec__vectors__vector__last_index container__split_fields)) vectors__insert__L_1__R10b__assume)
  (=> (= vectors__insert__L_1__R10b__assume r10b)
  (=> (dynamic_invariant r10b true false true true)
  (=>
  (= (to_rep2 (rec__vectors__cursor__index (us_split_fields1 before))) temp___275)
  (let ((temp___276 r10b))
  (forall ((j Int))
  (=> (= j temp___276)
  (=>
  (= (and (ite (<= temp___275 j) true false) (ite (<= j temp___276) true
                                             false)) true)
  (forall ((container__split_fields1 us_split_fields2) (j1 Int))
  (=>
  (= (and (ite (and
               (and
               (= (rec__vectors__vector__id container__split_fields1) 
               (rec__vectors__vector__id container__split_fields))
               (= (rec__vectors__vector__sig container__split_fields1) 
               (rec__vectors__vector__sig container__split_fields)))
               (= (rec__vectors__vector__last_index container__split_fields1) 
               (rec__vectors__vector__last_index container__split_fields)))
          true false) (ite (and
                           (<= (to_rep2
                               (rec__vectors__cursor__index
                               (us_split_fields1 before))) j1)
                           (<= j1 r10b))
                      true false)) true)
  (forall ((o Int))
  (=>
  (= (to_rep4
     (select (rec__vectors__vector__elements container__split_fields1) j1)) o)
  (forall ((o1 element_type))
  (=> (= (to_rep4 o1) o) (let ((o2 (+ j1 1))) (=> (in_range7 o2) (<= 1 o2)))))))))))))))))))))
(check-sat)
(exit)
